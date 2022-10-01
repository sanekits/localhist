# test_bash_history_tool.py
from imp import reload
import sys
from datetime import datetime
import os
import random


LH_ROOT = os.environ["LH_ROOT"]  # Should point to the localhist/ dir
sys.path.insert(0, LH_ROOT)
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

SYNTH_FAKE_90DAYS = f"{LH_ROOT}/test/home1/synth-fake-90days"


def test_load_raw_log():
    stream = io.StringIO(SAMPLE_LOG_1)
    vv = [r for r in load_raw_log(stream)]
    assert len(vv) == 4
    assert "pr-urls" in vv[3].msg


def test_fake_90days():
    with open(SYNTH_FAKE_90DAYS, "r") as stream:
        vv = [r for r in load_raw_log(stream)]
    assert len(vv) == 90
    assert "90 days old" in vv[0].msg
    assert vv[0].timestamp == datetime.fromtimestamp(1656812544)
    assert "1 days old" in vv[89].msg
    assert vv[89].timestamp == datetime.fromtimestamp(1664502144)
    stream.close


def test_load_bucket():
    with open(SYNTH_FAKE_90DAYS, "r") as stream:
        bucket = load_bucket(Bucket("raw"), load_raw_log(stream))
    random.shuffle(bucket.events)
    bucket = load_bucket(Bucket("sorted"), bucket.events)
    # Prove it's back in order
    for i in range(0, len(bucket.events) - 1):
        assert bucket.events[i].timestamp <= bucket.events[i + 1].timestamp


def test_BucketFarm_add():
    farm = BucketFarm()
    for name, ix, should_add in (
        ("2018-07", 0, True),
        ("2018-06", 0, True),
        ("2017-12", 0, True),
        ("2018-07", 2, False),
        ("2020-11", 3, True),
    ):
        stat = farm._add_bucket(name)
        assert stat.bucket.bucket_name == name
        assert stat.index == ix
        assert stat.isNew == should_add


def test_BucketFarm_reload():
    farm = BucketFarm()
    reload_bucket_farm(farm, f"{LH_ROOT}/test/home1/archive-tree-1")

    for item in ((8, "2018-07"), (29, "2020-11")):
        check_event_msg = farm.get_bucket(item[1]).events[item[0]].msg
        assert check_event_msg.startswith(f"Event {item[0]}") == True


def test_coalesce_events():
    farm = BucketFarm()
    context = Context()
    # This test data was created with "make home2-data":
    testdata_dir = f"{LH_ROOT}/test/home2/pf140XGZ"
    context.archive_dir = testdata_dir + "/buckets"

    # F i l e   G r o u p  1
    #
    # We'll build our bucket farm from a subset of the data, leaving the rest
    # for merge validation
    context.input_files = [f"{testdata_dir}/{f}" for f in os.listdir(testdata_dir)[0:5]]

    coalesce_events(context, farm)
    for i, n in enumerate([221, 352, 117, 24, 15]):
        assert len(farm._buckets[i].events) == n

    write_farm(context.archive_dir, farm)

    # F i l e   G r o u p  2
    #
    # When we merge in the remaining test files, what happens?
    context.input_files = [f"{testdata_dir}/{f}" for f in os.listdir(testdata_dir)[5:]]
    coalesce_events(context, farm)

    pass


if __name__ == "__main__":
    test_coalesce_events()
    test_BucketFarm_reload()
    test_BucketFarm_add()
    test_load_bucket()
    test_fake_90days()
    test_load_raw_log()
