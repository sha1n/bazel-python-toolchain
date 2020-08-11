import unittest
import sys


class PythonToolchainRuntimeTest(unittest.TestCase):

    def test_toolchain_runtime_interpreter(self):
        interpreter_path = python3_path()
        print(f"Interpreter path: {interpreter_path}")
        self.assertTrue(interpreter_path.__contains__("execroot/custom_python_toolchain"))


def python3_path():
    return sys.executable


if __name__ == '__main__':
    unittest.main()
