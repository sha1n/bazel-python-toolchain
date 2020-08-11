load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

rules_python_version = "dd7f9c5f01bafbfea08c44092b6b0c8fc8fcb77f"
rules_python_sha256 = "0aa9ec790a58053e3ab5af397879b267a625955f8297c239b2d8559c6773397b"


def rules_python():
    http_archive(
      name = "rules_python",
      sha256 = rules_python_sha256,
      strip_prefix= "rules_python-%s" % rules_python_version,
      urls = ["https://github.com/bazelbuild/rules_python/archive/%s.tar.gz" % rules_python_version],
    )
