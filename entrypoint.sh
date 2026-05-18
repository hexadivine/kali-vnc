#!/bin/bash
set -e

echo "Starting entrypoint..."

# Clean up old lock files (|| true prevents set -e from killing script)
rm -f /tmp/.X*-lock || true
rm -rf /tmp/.X11-unix/X* || true

export DISPLAY=:1
vncserver -kill :1 > /dev/null 2>&1 || true

echo "Setting up VNC..."
mkdir -p ~/.vnc
printf '#!/bin/bash\nstartxfce4 &\n' > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

echo "kali" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

touch /home/kali/.Xauthority
chmod 600 /home/kali/.Xauthority

echo "Starting dbus..."
export $(dbus-launch) || true

echo "Starting VNC server..."
vncserver :1 -geometry 1280x720 -depth 16 -AlwaysShared -SecurityTypes None

echo "VNC started, tailing logs..."
tail -f ~/.vnc/*.log
