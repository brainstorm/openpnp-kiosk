# Balena.io OpenPnP application

To build locally before pushing to Balena cloud:

```bash
docker buildx build --platform linux/arm64 . -f Dockerfile
```

If you wish to compile and generate binaries for OpenCV, [such as `libopencv_java342.so`](https://github.com/openpnp/openpnp/issues/916#issuecomment-599155808), just run the same command above but with `-f Dockerfile.opencv` argument.

## TODO

Fix the following error message:

```
16.03.20 14:50:13 (+0000)  main  2020-03-16 14:50:13.782 SystemLogger ERROR: Caused by: java.lang.UnsatisfiedLinkError: /usr/src/app/libopencv_java342.so: libtiff.so.5: cannot open shared object file: No such file or directory
```
