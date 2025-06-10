#!/bin/bash

# Clean up old lock files
rm -f /tmp/.X*-lock
rm -rf /tmp/.X11-unix/X*
export DISPLAY=:1
vncserver -kill :1 > /dev/null 2>&1

# Set up the VNC server
mkdir -p ~/.vnc
echo '#!/bin/bash\nstartxfce4 &' > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

# Set default VNC password
echo "kali" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Create .Xauthority if missing (for X11 authentication)
touch /home/kali/.Xauthority
chmod 600 /home/kali/.Xauthority

# Start DBus session (for XFCE4 and other apps that need it)
export $(dbus-launch)

# Start VNC server
vncserver :1 -geometry 1920x1080 -depth 24

# Start XFCE4 (or any window manager you prefer)
startxfce4 &

# Keep the container running
tail -f ~/.vnc/*.log
