load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

_interpreter_version = "3.8.5"
_interpreter_package_sha256 = "e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af66a83b0"


def register_python_toolchain():
    # NOTE: macOS's the default openssl binaries are not sufficient to build the SSL module. It is possible to change
    # the patch command to configure the build to use a custom SSL library by specifying '--with-openssl=<SSL lib path>'
    # to the configure script:
    #
    #       "./configure --prefix=$(pwd)/python_home --with-openssl=/path/to/openssl/1.1",
    #
    #
    # Here is the message yield by the build on macOS:
    #
    #   Could not build the ssl module!
    #   Python requires an OpenSSL 1.0.2 or 1.1 compatible libssl with X509_VERIFY_PARAM_set1_host().
    #   LibreSSL 2.6.4 and earlier do not provide the necessary APIs, https://github.com/libressl-portable/portable/issues/381
    #
    http_archive(
        name = "python_interpreter",
        urls = [
            "https://www.python.org/ftp/python/%s/Python-%s.tar.xz"%(_interpreter_version, _interpreter_version)
        ],
        sha256 = _interpreter_package_sha256,
        strip_prefix = "Python-%s"%_interpreter_version,
        patch_cmds = [
            "mkdir $(pwd)/python_home",
            "./configure --prefix=$(pwd)/python_home",
            "make",
            "make install",
            "ln -s python_home/bin/python3 python_bin",
        ],
        build_file_content = """
exports_files(["python_bin"])

filegroup(
name = "files",
srcs = glob(["python_home/**"], exclude = ["**/* *"]),
visibility = ["//visibility:public"],
)
""",
    )

    native.register_toolchains("//tools/python:py_toolchain")
