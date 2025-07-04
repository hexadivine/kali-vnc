# kali-vnc

A Dockerize Kali Linux environment with XFCE desktop accessible via VNC — offering a lightweight (compared to VirtualBox), powerful, and isolated setup for penetration testing.

![Setup Demo](./asset/setup.gif)

---

## Features

-   Kali Linux (rolling)
-   XFCE4 desktop environment
-   VNC server on port 5901
-   Pre-configured user: `kali` / password: `kali`
-   Root password: `root`
-   Easy setup and start/stop aliases

## Prerequisites

-   [Docker](https://docs.docker.com/get-docker/) should be installed on your system

## Installation

```sh
git clone https://github.com/hexadivine/kali-vnc.git
cd kali-vnc
./install.sh
```

### Access Kali GUI

```sh
startkali
```

`startkali` is an alias to `sudo docker start kali-vnc`. Execute command `startkali` to start the VNC Server on port `5901`. Use this command if GUI access is necessary.

### Access Kali CLI

```sh
runkali
```

`runkali` is an alias to `sudo docker exec -it kali-vnc /bin/zsh`. This opens CLI to execute kali-tools from host terminal.

### Stop Server

```sh
stopkali
```

`stopkali` is an alias to `sudo docker stop kali-vbc`. Use this command to stop the container.


## Uninstall kali-vnc

```sh
git clone https://github.com/hexadivine/kali-vnc.git
cd kali-vnc
./uninstall.sh
```
