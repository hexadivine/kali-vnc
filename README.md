# kali-vnc

A Dockerize Kali Linux environment with XFCE desktop accessible via VNC.

[![Watch the video](https://img.youtube.com/vi/uiJUg9pb-IQ/maxresdefault.jpg)](https://youtu.be/uiJUg9pb-IQ)

## Features

-   Kali Linux (rolling)
-   XFCE4 desktop environment
-   VNC server on port 5901
-   Pre-configured user: `kali` / password: `kali`
-   Root password: `root`
-   Easy setup and start/stop aliases

## Prerequisites

-   [Docker](https://docs.docker.com/get-docker/) should be installed on your system

## Install

Build and run the container:

```sh
cd /tmp
git clone https://github.com/hexadivine/kali-vnc.git
cd kali-vnc
./install.sh
```

## Start Server

```sh
startkali
```

## Stop Server

```sh
stopkali
```

## Uninstall

```sh
cd /tmp
git clone https://github.com/hexadivine/kali-vnc.git
cd kali-vnc
./uninstall.sh
```
