from app import index, home

def test_index():
    assert index() == "Hello World!"