# Balena.io OpenPnP application

To build locally before pushing to Balena cloud:

```bash
docker buildx build --platform linux/arm64 . -f Dockerfile
```

If you wish to compile and generate binaries for OpenCV, [such as `libopencv_java342.so`](https://github.com/openpnp/openpnp/issues/916#issuecomment-599155808), just run the same command above but with `-f Dockerfile.opencv` argument.

## TODO

Fix the following error issue: https://stackoverflow.com/questions/52500488/cant-obtain-static-method-fromnativemethod-object-from-class-com-sun-jna-nat

Backtrace:

```
16.03.20 22:44:01 (+0000)  main  2020-03-16 22:44:01.507 SystemLogger ERROR: Caused by: java.lang.UnsatisfiedLinkError: Can't obtain static method fromNative(Method, Object) from class com.sun.jna.Native
16.03.20 22:44:01 (+0000)  main  2020-03-16 22:44:01.513 SystemLogger ERROR:    at com.sun.jna.Native.initIDs(Native Method)
16.03.20 22:44:01 (+0000)  main  2020-03-16 22:44:01.518 SystemLogger ERROR:    at com.sun.jna.Native.<clinit>(Native.java:139)
16.03.20 22:44:01 (+0000)  main  2020-03-16 22:44:01.523 SystemLogger ERROR:    at com.sun.jna.NativeLibrary.<clinit>(NativeLibrary.java:82)
16.03.20 22:44:01 (+0000)  main  2020-03-16 22:44:01.528 SystemLogger ERROR:    at org.openpnp.capture.library.OpenpnpCaptureLibrary.<clinit>(OpenpnpCaptureLibrary.java:17)
16.03.20 22:44:01 (+0000)  main  2020-03-16 22:44:01.534 SystemLogger ERROR:    at org.openpnp.capture.OpenPnpCapture.<init>(OpenPnpCapture.java:15)
16.03.20 22:44:01 (+0000)  main  2020-03-16 22:44:01.539 SystemLogger ERROR:    at org.openpnp.machine.reference.camera.OpenPnpCaptureCamera.<init>(OpenPnpCaptureCamera.java:49)
16.03.20 22:44:01 (+0000)  main  2020-03-16 22:44:01.550 SystemLogger ERROR:    ... 68 more
```

Specifically, I need to recompile and adjust the following repos for ARM64:

https://github.com/openpnp/openpnp-capture

https://github.com/openpnp/openpnp-capture-java
