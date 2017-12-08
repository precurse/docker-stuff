# Syncthing-relay Docker Container

## Overview
This image uses a multi-stage build process. One development image is
used to build the image, while the binary is copied to a minimal image
(alpine) to run the binary. This means an image download size of ~6MB.

## Usage

```bash
docker volume create --name syncthing-relay
docker create --restart unless-stopped -p 22067:22067 -p 22070:22070 -v syncthing-relay:/var/syncthing-relay --name st-relay -it precurse/syncthing-relay
docker run st-relay
```

While creating the volume is optional, it ensures the generated keys will stay around when recreating containers. This is helpful
 when you hardcode the certificate on your syncthing clients like the documentation [shows]](https://docs.syncthing.net/users/relaying.html).

