# OpenPnP kiosk 

This repository deploys [OpenPnP](https://github.com/openpnp) software automatically on an `aarch64` compatible hardware, **currently targetting Jetson Nano <acronym title="Single Board Computer">SBCs</acronym>**.

# Quickstart

So, how do I get this to work on my Jetson nano quickly?

[First, follow steps 1 to 4 on balena.io][quickstart].. instead of balena-dash use this openpnp-kiosk repository (the one you are reading this README.md from).

[When those steps are completed, deploy the openpnp-kiosk "app" using the Balena CLI tools][software_deploy].

# How does this work?

The building is accomplished by bundling the dependencies and some library hacks (due to ongoing pending work upstream) on a docker container. The release engineering and deploy management is handled by [Balena][balena].

[Balena][balena] (:whale: in Catalan) allows to deploy a ["kiosk"][x11_balena] version of OpenPnP. Think of Balena as a free (as in beer) alternative to [AWS IoT Greengrass][aws_greengrass], [Google Cloud IoT][gcloud_iot] or [Azure IoT][azure_iot], to name a few payware platforms.

# Developing

Great! You want to add some tweaks to this project? To build locally before pushing to Balena cloud (or use it somewhere else):

To push new Dockerfile changes to balena, i.e for Jetson Nano SBC:

```
balena push --dockerfile Dockerfile.jetson.nano
```

Alternatively, you can just install the software on the RPi itself running the commands found in the Dockerfile itself, no cloud nor docker involved ;)

![rpi3openpnp](img/rpi3_embedded_display.jpg)
![rpi3openpnpbigmon](img/first-raspberrypi3-success.png)

[gcloud_iot]: https://cloud.google.com/solutions/iot
[aws_greengrass]: https://aws.amazon.com/greengrass/
[azure_iot]: https://azure.microsoft.com/en-us/overview/iot/
[x11_balena]: https://github.com/balenalabs-incubator/x11-window-manager
[balena]: https://www.balena.io/
[graalvm_aarch64]: https://github.com/graalvm/graalvm-ce-builds/releases/tag/vm-20.0.0
[quickstart]: https://www.balena.io/blog/make-a-web-frame-with-raspberry-pi-in-30-minutes/#setupoftheraspberrypi
[software_deploy]: https://www.balena.io/blog/make-a-web-frame-with-raspberry-pi-in-30-minutes/#deployingcode
