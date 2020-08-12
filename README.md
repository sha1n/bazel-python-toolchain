# Bazel Python Toolchain
A basic working example of how you can setup a custom and independent Python 3 toolchain with Bazel. 
The bright side of this approach is that you no longer have to rely on locally installed Python interpreters, which can really simplify things, especially in large development groups.
The dark side might be that clean builds are extra expensive (~5 to 6 minutes when I tested!)

```bash
git clone git@github.com:sha1n/bazel-python-toolchain.git

bazel test //tests:toolchain_test
```

## Open Issues
SSL module fails to build on macOS with OpenSSL version < 1.0.2. The toolchain still builds and works, but Python will 
not have SSL support in that case. This can be cured by passing `--with-openssl=/path/to/openssl/1.1` to the `configure`
script that is called to configure the interpreter build environment before we build it (see `tools/python/toolchain.bzl`).
