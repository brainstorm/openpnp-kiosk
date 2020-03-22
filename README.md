# Balena.io OpenPnP application

To build locally before pushing to Balena cloud:

```bash
docker buildx build --platform linux/arm64 . -f Dockerfile
```

If you wish to compile and generate binaries for OpenCV, [such as `libopencv_java342.so`](https://github.com/openpnp/openpnp/issues/916#issuecomment-599155808), just run the same command above but with `-f Dockerfile.opencv` argument.

## TODO

Fix the following error issue: https://stackoverflow.com/questions/52500488/cant-obtain-static-method-fromnativemethod-object-from-class-com-sun-jna-nat

Specifically, I need to recompile and adjust the following repos for ARM64:

https://github.com/openpnp/openpnp-capture

https://github.com/openpnp/openpnp-capture-java
