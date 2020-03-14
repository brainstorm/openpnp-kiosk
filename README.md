# Balena.io OpenPnP application

To build locally before pushing to Balena cloud:

```bash
docker buildx build --platform linux/arm64 .
```

 [ ]: Use corretto JDK for ARM64.
 [ ]: Refine machine.xml provisioning.
 [ ]: Cleanup dockerfile, remove unnecessary deps.
