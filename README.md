# Balena.io OpenPnP application

To build locally before pushing to Balena cloud:

```bash
docker buildx build --platform linux/arm64 . -f Dockerfile
```

If you wish to compile and generate binaries for OpenCV, [such as `libopencv_java342.so`](https://github.com/openpnp/openpnp/issues/916#issuecomment-599155808), just run the same command above but with `-f Dockerfile.opencv` argument.

## TODO

(Cross-)Compile OpenCV 3.4.2 for ARM64 to avoid the following error message:

```
15.03.20 01:28:41 (+0000)  main  2020-03-15 01:28:41.117 SystemLogger ERROR: java.lang.Exception: Error while reading machine.xml (/usr/src/app/libopencv_java342.so: /usr/src/app/libopencv_java342.so: wrong ELF class: ELFCLASS32 (Possible cause: architecture word width mismatch))
```
