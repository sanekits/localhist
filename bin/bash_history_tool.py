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



import sys
import os
from typing import Iterable, OrderedDict, List
from collections import OrderedDict
import re
from datetime import datetime
from io import TextIOWrapper

testdata_1='''
#1628246305
ls
#1628246312
rm -rf ELT-2021-Jul-26-LF-NY/ # comment
#1628246324
cd
#1628216330
mv .bash_logout bash_logout # comment
#1628246333
'''

RE_TIMESTAMP=re.compile('^#\d+\s*$')

def get_events_reversed(text:str) -> str:
    ''' Yield one event at a time in reverse order.'''
    for line in reversed(text.splitlines()):
        if line:
            yield line

class Context:
    def __init__(self):
        self.input_files:List[str]=[]
        self.output_dir:str=None

class CoalesceState:
    def __init__(self):
        self.buckets={}

class LogEvent:
    def __init__(self,timestamp:datetime= None,msg:str=None):
        self.msg:string = msg
        self.timestamp:datetime = timestamp

    def __repr__(self):
        return f"#{int(self.timestamp.timestamp())}\n{self.msg}"


class Command:
    def __init__(self, command_text: str, timestamp: int = 0):
        self.command_text = command_text
        self.timestamp = timestamp
    def __hash__(self):
        return self.command_text.__hash__()
    def __str__(self):
        if self.timestamp:
            return '\n'.join((f'#{self.timestamp}',self.command_text))
        return self.command_text


def is_timestamp(line:str) -> bool:
    if RE_TIMESTAMP.match(line):
        return True
    return False

def load_raw_log( instream: TextIOWrapper ) -> LogEvent:
    ''' Yield events from instream '''
    curDate:datetime=datetime.now()
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
            yield LogEvent(curDate,line.rstrip())


def condense_bash_history(
    event_stream: Iterable, cache: OrderedDict = None
) -> OrderedDict:
    if not cache:
        cache = OrderedDict()
    for event in event_stream:
        if is_timestamp(event):
            timestamp=int(event[1:])
            try:
                last_command=next(reversed(cache))
            except StopIteration:
                continue

            if cache[last_command].timestamp == 0:
                cache[last_command].timestamp = timestamp
        else:
            if not '#' in event:
                continue
            command = Command(event)
            if command.command_text in cache:
                continue
            cache[event]=command
    time_ordered = sorted(cache.values(),key=lambda x: x.timestamp)
    return time_ordered

def coalesce_events(context:Context, state:CoalesceState()) -> bool:
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

def parse_args(argv:List[str]) -> Context:
    ctx=Context()
    mode="undefined"
    try:
        for ndx,arg in enumerate(argv):
            if arg == '--input':
                ctx.input_files.append(argv[ndx+1])
            elif arg == "--output":
                ctx.output_dir = argv[ndx+1]
            elif arg == "--mode":
                mode=argv[ndx+1]

        if not mode:
            raise RuntimeError("No --mode specified")
        if not mode in ["coalesce"]:
            raise RuntimeError(f"Unknown --mode {mode}")
        if not ctx.input_files:
            ctx.input_files.append("/dev/stdin")
        if not ctx.output_dir:
            ctx.output_dir=f"{os.environ.get('HOME','/')}/.localhist-archive"

    except ex as Exception:
        raise RuntimeError(f"Can't parse command line {argv}: {ex}")


if __name__=="__main__":
    context = parse_args(sys.argv)
    state = CoalesceState()
    sys.exit(0)
