# Balena.io OpenPnP application

To build locally before pushing to Balena cloud:

```bash
docker buildx build --platform linux/arm64 . -f Dockerfile
```

If you wish to compile and generate binaries for OpenCV, [such as `libopencv_java342.so`](https://github.com/openpnp/openpnp/issues/916#issuecomment-599155808), just run the same command above but with `-f Dockerfile.opencv` argument.

## TODO

It works (application launches)! But as always there are some tweaks left to do:

* Make sure udev and USB docker container pass-through is stable for cameras and control board.
* Upgrade to upstream's OpenCV 4.x, taking advantage of system's Debian packages and removing the custom-compiled `libopencv_java342.so`.
* Report upstream on OpenPnP that JNErator and JNA/JNI need to be updated to at least 4.5.1, otherwise `obj/libjnidispatch.so` and `LD_LIBRARY_PATH` hacks are needed for newer Linux distributions.
* Get PRs for [openpnp-capture-java](https://github.com/openpnp/openpnp-capture-java/pull/3) and [openpnp-capture](https://github.com/openpnp/openpnp-capture/pull/35) merged upstream.
* Provision different machines, not just the LitePlacer.
* Provision properly populated `parts.xml` and `packages.xml`. Come up with a better provisioning mechanism than updating those two files periodically.
* Make Java UI style more modern looking-like, the default awt look is horrible :P
