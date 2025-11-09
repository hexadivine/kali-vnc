FROM kalilinux/kali-rolling

LABEL maintainer="Hrushikesh Dolas <hexadivine@gmail.com>"

RUN apt update
RUN apt install kali-desktop-xfce -y
RUN apt install tightvncserver dbus-x11 x11-xserver-utils -y
RUN apt clean && rm -rf /var/lib/apt/lists/* 

RUN echo "root:root" | chpasswd
RUN useradd -ms /bin/bash kali
RUN echo "kali:kali" | chpasswd

# Set the USER environment variable for VNC server
ENV USER=kali

# Switch to the new user (required for vnc)
USER kali
WORKDIR /home/kali

EXPOSE 5901

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
