from distutils.core import setup, Extension


def main():
    setup(
        name="log",
        version="1.0.0",
        ext_modules=[Extension("log", ["log.c"])],
    )


if __name__ == "__main__":
    main()
