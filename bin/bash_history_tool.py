#!/usr/bin/env python3

# Helper for bash history maintenance.
#  - Condense + order a history stream or file:
#     - Remove dupes, coalesce timestamps, keep most recent only,
#        discard entries without comment hashes, impose strict
#        time-ordering



import sys
from typing import Iterable, OrderedDict, List
from collections import OrderedDict
import re

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

def get_events_reversed(text:str) -> str:
    ''' Yield one event at a time in reverse order.'''
    for line in reversed(text.splitlines()):
        if line:
            yield line

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

RE_TIMESTAMP=re.compile('^#\d+\s*$')

def is_timestamp(line:str) -> bool:
    if RE_TIMESTAMP.match(line):
        return True
    return False

def condense_bash_history(
    event_stream: Iterable, cache: OrderedDict = None
) -> OrderedDict:
    """Read events from event_stream.  Events should be in reverse-list order.
    First we distinguish timestamps from commands.

    If event is a command, and does not contain a '#', it is discarded.
    If the command is already present in cache, then it is discarded.
    Remaining commands are added to the cache.

    If event is a timestamp, and the most-recently-added-command lacks a timestamp, the timestamp is added to that event.

    Returns: cache in reverse-timestamp order without duplicates
    """
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

def cleanup_stream(instream,outstream):
    ''' Reorder, remove dupes and uncommented, ensure uniqueness '''
    for event in condense_bash_history(get_events_reversed(instream.read())):
        outstream.write(str(event))
        outstream.write('\n')

def parse_args(argv:List[str]):
    if len(argv) > 1:
        raise RuntimeError(f"Unknown argument: {argv[1]}")
    return '/dev/stdin','/dev/stdout'


if __name__=="__main__":
    infile,outfile=parse_args(sys.argv)
    with open(infile,'r') as instr, open(outfile,'w') as ostr:
        cleanup_stream(instr,ostr)
    sys.exit(0)
