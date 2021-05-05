import os
import pytest
import json


FIXTURES_DIR = os.path.join(os.path.dirname(__file__), 'infra')

def assert_output(testname, output):
    with open(f'test/files/{testname}.json', 'r') as f:
        data = json.load(f)
    
        assert sorted(data) == sorted(output)

def test_resources(apply_runner):
    _, output = apply_runner(
        FIXTURES_DIR,
        defaults_backend_name="test-backend",
        defaults_backend_host="test-host", 
        ssl_ca_cert="line 1\nline 2\nline 3\n", 
        ssl_check_cert="never",
        ssl_sni_hostname="test-sni.hostname")

    assert_output("output",output)



