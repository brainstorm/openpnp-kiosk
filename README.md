# Balena.io OpenPnP application

To build locally before pushing to Balena cloud:

```bash
docker buildx build --platform linux/arm64 . -f Dockerfile
```

If you wish to compile and generate binaries for OpenCV, [such as `libopencv_java342.so`](https://github.com/openpnp/openpnp/issues/916#issuecomment-599155808), just run the same command above but with `-f Dockerfile.opencv` argument.

## TODO

Fix the following error message:

```
Caused by: java.lang.UnsatisfiedLinkError: Native library (com/sun/jna/linux-aarch64/libjnidispatch.so) not found in resource path (/usr/src/app/openpnp/target/openpnp-gui-0.0.1-alpha-SNAPSHOT.jar)
```
