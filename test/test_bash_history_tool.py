# test_bash_history_tool.py
import sys
import os
sys.path.insert(0,f"{os.getcwd()}/bin")
import io
from bash_history_tool import *

SAMPLE_LOG_1 = r"""#1664572423
ghe pr list -R bkrochta/bas-fxc  url
#1664572440
ghe pr list -R bkrochta/bas-fxc --json url
#1664572570
tmk trainee-prs
#1664572672
tmk trainee-prs > trainee-pr-urls"""

def test_load_raw_log():
    stream = io.StringIO(SAMPLE_LOG_1)
    vv = [ r for r in load_raw_log( stream ) ]
    assert len(vv) == 4
    assert 'pr-urls' in vv[3].msg


if __name__ == "__main__":
    test_load_raw_log()
