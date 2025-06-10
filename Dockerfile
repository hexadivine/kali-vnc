FROM kalilinux/kali-rolling

LABEL maintainer="Hrushikesh Dolas <hexadivine@gmail.com>"

# Set noninteractive mode for installation
#ENV DEBIAN_FRONTEND=noninteractive

# Update and install packages
RUN apt-get update && \
    apt-get install -y \
    tightvncserver \
    xfce4 xfce4-goodies \
    dbus-x11 x11-xserver-utils \
    kali-linux-default \
    && apt-get clean

# Set root password
RUN echo "root:root" | chpasswd

# Create a user to run the VNC server
RUN useradd -ms /bin/bash kali

# Set the USER environment variable for VNC server
ENV USER=kali

# Set VNC password for the user
RUN echo "kali:kali" | chpasswd

# Switch to the new user (required for vnc)
USER kali
WORKDIR /home/kali

# Expose VNC port (default 5901 for display :1)
EXPOSE 5901

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint to our script
ENTRYPOINT ["/entrypoint.sh"]
