FROM debian:stretch-slim

RUN apt-get update && apt-get install -y wine wget && dpkg --add-architecture i386 && apt-get update && apt-get install -y wine32 libgl1-mesa-glx:i386 xserver-xorg-video-intel:i386
RUN cd /tmp && wget  http://dl.winehq.org/wine/wine-gecko/2.40/wine_gecko-2.40-x86.msi && wine msiexec /i /tmp/wine_gecko-2.40-x86.msi
RUN rm -f /root/.wine/system.reg /root/.wine/user.reg
COPY system.reg /root/.wine/
COPY user.reg /root/.wine/

CMD bash -c '(cd /pwi && wine launcher.exe &); while ! ps aux | grep "cpw$"; do sleep 10; done; tail -f --pid $(ps aux | grep "cpw$" | awk "{print \$2}") /dev/null'
