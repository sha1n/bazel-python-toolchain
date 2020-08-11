load("@rules_python//python:python.bzl", "py_binary", "py_library", "py_test")

def py3_library(*args, **kwargs):
    py_library(
        srcs_version = "PY3",
        *args,
        **kwargs
    )

def py3_binary(name, main = None, *args, **kwargs):
    if main == None:
        main = "%s.py" % (name)

    py_binary(
        name = name,
        main = main,
        legacy_create_init = False,
        python_version = "PY3",
        *args,
        **kwargs
    )

def py3_test(*args, **kwargs):
    py_test(
        legacy_create_init = False,
        python_version = "PY3",
        srcs_version = "PY3",
        *args,
        **kwargs
    )
