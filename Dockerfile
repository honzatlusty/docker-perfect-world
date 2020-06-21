FROM debian:stretch-slim

RUN apt-get update && apt-get install wine wget && dpkg --add-architecture i386 && apt-get update && apt-get install wine32 libgl1-mesa-glx:i386 xserver-xorg-video-intel:i386
RUN cd /tmp && wget  http://dl.winehq.org/wine/wine-gecko/2.40/wine_gecko-2.40-x86.msi && wine msiexec /i /tmp/wine_gecko-2.40-x86.msi
RUN rm -f /root/.wine/system.reg
COPY system.reg /root/.wine/
CMD bash -c 'wine /pwi/launcher.exe'
