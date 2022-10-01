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
from genericpath import isfile
import sys
import os
from textwrap import indent
from typing import Iterable, OrderedDict, Dict, List, Callable, TextIO, Tuple
from collections import OrderedDict
import re
from datetime import datetime
from io import TextIOWrapper
from pathlib import Path

RE_TIMESTAMP = re.compile("^#\d+\s*$")


class Context:
    def __init__(self):
        self.input_files: List[str] = []
        """ Input files are "raw" shell history -- typically timestamp-interleaved
        events captured at the shell prompt """

        self.archive_dir: str = None
        """ The archive dir is the parent of the per-month bucket dirs, e.g.
        in /my_host/2020-12, /my_host is the archive dir """

        self.event_filters: List[Callable] = []
        """ An event filter takes a single event arg and returns True if
        it passes the filter criteria """


class LogEvent:
    def __init__(self, timestamp: datetime = None, msg: str = None):
        self.msg: str = msg
        self.timestamp: datetime = timestamp

    def __repr__(self):
        return self.__str__().replace("\n", "\t")

    def __str__(self):
        return f"#{int(self.timestamp.timestamp())}\n{self.msg}"

    def get_bucket_name(self) -> str:
        """Returns YYYY-MM bucket name derived from timestamp"""
        return f"{self.timestamp.year}-{self.timestamp.month:02}"


class Bucket:
    """Represents a single event bucket like 2021-09, with events"""

    def __init__(self, bucket_name: str):
        self.bucket_name = bucket_name
        """ A bucket_name can be anything, but the archived buckets
        will have names like "YYYY-MM" representing the year and month
        of the event records """

        self.events: List[LogEvent] = []
        """ The events in the bucket, usually timestamp-ordered """

        self.index: Dict[str, List[int]] = None
        """ Optional event index maps the msg text to the list of records matching that msg, by offset """

    def reset(self):
        """Remove events"""
        self.events = []

    def add_index(self) -> None:
        """Re-index events by msg text"""
        self.index = {}
        for i, r in enumerate(self.events):
            if r.msg in self.index:
                self.index[r.msg].append(i)
            else:
                self.index[r.msg] = [i]


class BucketStat:
    def __init__(self, bucket, index, isNew):
        self.bucket: Bucket = bucket
        self.index: int = index
        self.isNew: bool = isNew


class BucketFarm:
    """A set of buckets with distinct ordered names"""

    def __init__(self):
        self._buckets: List[Bucket] = []
        """ _buckets is ordered by .bucket_name at all times """

        self._bucket_names: List[int] = []
        """ _bucket_names is an ordered list of bucket names, so we're optimized for
        search with this data duplication. """

    def _add_bucket(self, bucket_name: str) -> BucketStat:
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
        return BucketStat(self._buckets[index], index, added)

    def get_bucket(self, bucket_name: str) -> Bucket:
        """Returns bucket with given name.  Creates it if not found"""
        stat = self._add_bucket(bucket_name)
        return stat.bucket


def load_bucket(
    bucket: Bucket, event_iter, ensure_order=True, add_index=False
) -> Bucket:
    """Load a bucket from an event stream, and order events by time if ensure_order is set"""
    bucket.events += [e for e in event_iter]
    if ensure_order:
        bucket.events = sorted(bucket.events, key=lambda ev: ev.timestamp)
    if add_index:
        bucket.add_index()
    return bucket


# Match strings like 2022-11:
RE_MONTHSTAMP = re.compile(r"^2[0-9][0-9][0-9]-[01][0-9]$")


def reload_bucket_farm(
    farm: BucketFarm, farm_root_dir: str, bucket_filter: Callable = None
) -> None:
    """For each date-named dir in farm_root_dir, if there's a bash_history file,
    create or rebuild a corresponding bucket in 'farm'.  Any old buckets with
    matching names will be reset to empty and reloaded from the file content.

    Caller can provide a bucket-name filter which overrules loading a bucket."""

    def qualify_dir(dir: Path):
        if os.path.isfile(dir / "bash_history"):
            if RE_MONTHSTAMP.match(dir.name):
                if bucket_filter:
                    return bucket_filter(dir.name)
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


def load_filtered_log(instream: TextIOWrapper, filter: Callable) -> LogEvent:
    """Load a log stream, applying caller's filter to events"""
    for ev in load_raw_log(instream):
        if filter(ev):
            yield ev


def dumb_logs_filter(event: LogEvent) -> bool:
    return True


def coalesce_events(context: Context, bucket_farm: BucketFarm) -> bool:
    """Read events from context.input_files.  Input file order is unimportant.
    Within each file it is assumed that the timestamp precedes the correlated log record.  If
    with no timestamp occurs for a record, we just re-apply the most recent timestamp seen.

    For each timestamped event, significance filters are applied to remove "junk" records,
    and then the event is allocated into a yyyy-mm bucket and merged with previously-stored bucket
    contents from archive.

    """
    bucket_cache = {}

    def bucket_from_cache(bucket_name) -> Bucket:
        try:
            return bucket_cache[bucket_name]
        except KeyError:
            pass
        bucket_stat = bucket_farm._add_bucket(bucket_name)
        # If the bucket object isn't in memory , let's try to load its archived content:
        if bucket_stat.isNew:
            bucket_source = Path(context.archive_dir) / bucket_name / "bash_history"
            if os.path.isfile(bucket_source):
                with open(bucket_source, "r") as ff:
                    load_bucket(
                        bucket_stat.bucket,
                        load_raw_log(ff),
                        ensure_order=False,
                        add_index=True,
                    )
        bucket_cache[bucket_name] = bucket_stat.bucket

    for log_filename in context.input_files:
        with open(log_filename, "r") as instream:
            for event in load_filtered_log(instream, dumb_logs_filter):
                bucket_name = event.get_bucket_name()
                bucket = bucket_from_cache(bucket_name)
                pass


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
    sys.exit(0)
