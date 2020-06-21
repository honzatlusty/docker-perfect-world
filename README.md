# docker-perfect-world
A docker container that runs the mmorpg Perfect World
```
podman run -it --rm  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/honza/pwi/ExternalPWcom/:/pwi  --device /dev/snd --device /dev/dri/     localhost/pwi-wine /bin/bash
```

then inside container wincfg and set display settings
