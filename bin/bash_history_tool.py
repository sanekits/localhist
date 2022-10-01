#!/usr/bin/env python3

# Helper for bash history maintenance.
#  - Condense + order a history stream or file:
#
#  --mode coalesce:
#     Take one or more --input files and clean, merge sort with a "coalesced history"
#     held in the --output tree.
#
#      - Each subdir of the output tree is named for the month of the events it contains,
#     e.g. 2022-11 is Nov 2022.
#
#      - When reading input we first sort events into a monthly bucket by timestamp.  Each
#        event is filtered to remove dupes within the month, such that only the latest
#        entry is preserved per month.  We also remove short/low-value entries.
#
#      - The coalesce process will reload YYYY-MM/bash_history files as needed to merge
#        the incoming records and keep the files ordered and filtered.
#


from audioop import add
from bisect import bisect_left
import sys
import os
from typing import Iterable, OrderedDict, List, Callable, Tuple
from collections import OrderedDict
import re
from datetime import datetime
from io import TextIOWrapper
from pathlib import Path

RE_TIMESTAMP = re.compile("^#\d+\s*$")


def get_events_reversed(text: str) -> str:
    """Yield one event at a time in reverse order."""
    for line in reversed(text.splitlines()):
        if line:
            yield line


class Context:
    def __init__(self):
        self.input_files: List[str] = []
        self.output_dir: str = None


class CoalesceState:
    def __init__(self):
        self.buckets = {}


class LogEvent:
    def __init__(self, timestamp: datetime = None, msg: str = None):
        self.msg = msg
        self.timestamp = timestamp

    def __repr__(self):
        return f"#{int(self.timestamp.timestamp())}\n{self.msg}"


class Bucket:
    """Represents a single event bucket like 2021-09, with events"""

    def __init__(self, bucket_name: str):
        self.bucket_name = bucket_name
        """ A bucket_name can be anything, but the archived buckets
        will have names like "YYYY-MM" representing the year and month
        of the event records """
        self.events: List[LogEvent] = []

    def reset(self):
        """Remove events"""
        self.events = []


class BucketFarm:
    """A set of buckets with distinct ordered names"""

    def __init__(self):
        self._buckets: List[Bucket] = []
        """ _buckets is ordered by .bucket_name at all times """
        self._bucket_names: List[int] = []
        """ _bucket_names is an ordered list of bucket names, so we're optimized for
        search with this data duplication. """

    def _add_bucket(self, bucket_name: str) -> Tuple[Bucket, int, bool]:
        """Add a bucket with the given name if it doesn't exist.
        New bucket will be ordered by bucket_name.  Returns bucket and
        index at which bucket can be found in the ._buckets list, whether
        or not a new bucket was created. Last member of result tuple is
        a bool indicating whether bucket was newly created."""
        index = bisect_left(self._bucket_names, bucket_name)
        added = False
        if index >= len(self._bucket_names):
            # Add to the end:
            self._buckets.append(Bucket(bucket_name))
            self._bucket_names.append(bucket_name)
            added = True
        elif self._bucket_names[index] == bucket_name:
            # Found existing bucket with that name:
            pass
        else:
            # Need to insert new bucket at index
            self._bucket_names.insert(index, bucket_name)
            self._buckets.insert(index, Bucket(bucket_name))
            added = True
        return self._buckets[index], index, added

    def get_bucket(self, bucket_name: str) -> Bucket:
        """Returns bucket with given name.  Creates it if not found"""
        result = self._add_bucket(bucket_name)
        return result[0]


def load_bucket(bucket: Bucket, event_iter, ensure_order=True) -> Bucket:
    """Load a bucket from an event stream, and order events by time if ensure_order is set"""
    bucket.events += [e for e in event_iter]
    if ensure_order:
        bucket.events = sorted(bucket.events, key=lambda ev: ev.timestamp)
    return bucket


# Match strings like 2022-11:
RE_MONTHSTAMP = re.compile(r"^2[0-9][0-9][0-9]-[01][0-9]$")


def reload_bucket_farm(farm: BucketFarm, farm_root_dir: str) -> None:
    """For each date-named dir in farm_root_dir, if there's a bash_history
    file, create or rebuild a corresponding bucket in 'farm'.  Any old buckets with matching names will be reset to empty and reloaded from the file
    content."""

    def qualify_dir(dir: Path):
        if os.path.isfile(dir / "bash_history"):
            if RE_MONTHSTAMP.match(dir.name):
                return True
        return False

    farm_root = Path(farm_root_dir)
    subdirs_iter = (d for d in farm_root.glob("*") if qualify_dir(d))
    for dir in subdirs_iter:
        bucket = farm.get_bucket(dir.name)
        if len(bucket.events):
            bucket.reset()
        with open(farm_root / dir.name / "bash_history") as ff:
            # When we're reloading a bucket farm from disk, we expect that
            # the events are already clean and ordered, thus ensure_order is False
            load_bucket(bucket, load_raw_log(ff), ensure_order=False)


class Command:
    def __init__(self, command_text: str, timestamp: int = 0):
        self.command_text = command_text
        self.timestamp = timestamp

    def __hash__(self):
        return self.command_text.__hash__()

    def __str__(self):
        if self.timestamp:
            return "\n".join((f"#{self.timestamp}", self.command_text))
        return self.command_text


def is_timestamp(line: str) -> bool:
    if RE_TIMESTAMP.match(line):
        return True
    return False


def load_raw_log(instream: TextIOWrapper) -> LogEvent:
    """Yield events from instream"""
    curDate: datetime = datetime.now()
    while True:
        line = instream.readline()
        if not line:
            return
        if is_timestamp(line):
            try:
                curDate = datetime.fromtimestamp(int(line[1:]))
            except Exception as e:
                continue
        else:
            yield LogEvent(curDate, line.rstrip())


def condense_bash_history(
    event_stream: Iterable, cache: OrderedDict = None
) -> OrderedDict:
    if not cache:
        cache = OrderedDict()
    for event in event_stream:
        if is_timestamp(event):
            timestamp = int(event[1:])
            try:
                last_command = next(reversed(cache))
            except StopIteration:
                continue

            if cache[last_command].timestamp == 0:
                cache[last_command].timestamp = timestamp
        else:
            if not "#" in event:
                continue
            command = Command(event)
            if command.command_text in cache:
                continue
            cache[event] = command
    time_ordered = sorted(cache.values(), key=lambda x: x.timestamp)
    return time_ordered


def coalesce_events(context: Context, state: CoalesceState()) -> bool:
    """Read events from event_stream.  Input order is unimportant, except
    that we assume the timestamp precedes the correlated log record.  If
    we encounter log records with no timestamp, we just re-apply the most
    recent timestamp we have seen.

    Once we have a timestamp, we translate it into a yyyy-mm bucket name,
    and load (or fetch from cache) the corresponding previously-stored
    data for that bucket so the new record can be merged in with its
    peers.

    In the end, any modified buckets are written back out in time-order.  Thus
    the new data is

    Returns: cache in reverse-timestamp order without duplicates
    """
    pass


# def cleanup_stream(instream,outstream):
#     """ obsolete function """
#     ''' Reorder, remove dupes and uncommented, ensure uniqueness '''
#     for event in condense_bash_history(get_events_reversed(instream.read())):
#         outstream.write(str(event))
#         outstream.write('\n')


def parse_args(argv: List[str]) -> Context:
    ctx = Context()
    mode = "undefined"
    try:
        for ndx, arg in enumerate(argv):
            if arg == "--input":
                ctx.input_files.append(argv[ndx + 1])
            elif arg == "--output":
                ctx.output_dir = argv[ndx + 1]
            elif arg == "--mode":
                mode = argv[ndx + 1]

        if not mode:
            raise RuntimeError("No --mode specified")
        if not mode in ["coalesce"]:
            raise RuntimeError(f"Unknown --mode {mode}")
        if not ctx.input_files:
            ctx.input_files.append("/dev/stdin")
        if not ctx.output_dir:
            ctx.output_dir = f"{os.environ.get('HOME','/')}/.localhist-archive"

    except Exception as ex:
        raise RuntimeError(f"Can't parse command line {argv}: {ex}")


if __name__ == "__main__":
    context = parse_args(sys.argv)
    state = CoalesceState()
    sys.exit(0)
