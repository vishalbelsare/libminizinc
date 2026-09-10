from pathlib import Path
from minizinc import default_driver, Driver
import subprocess
import json


def test_json_stream_trace_stdout():
    here = Path(__file__).resolve().parent
    assert isinstance(default_driver, Driver)
    model_file = here / "test_json_stream_trace_stdout.mzn"
    p = subprocess.run(
        [default_driver._executable, model_file, "--json-stream"],
        stdin=None,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    assert p.returncode == 0
    messages = [json.loads(l) for l in p.stdout.splitlines(False)]
    traces = [m for m in messages if m["type"] == "trace"]
    assert len(traces) == 1
    assert traces[0] == {"type": "trace", "section": "default", "message": "trace"}
    solution = next(m for m in messages if m["type"] == "solution")
    expected = {
        "type": "solution",
        "output": {"default": "output", "raw": "output"},
        "sections": ["default", "raw"],
    }
    assert solution == expected
