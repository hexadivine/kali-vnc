#!/bin/bash
set -e
echo "Starting entrypoint..."

rm -f /tmp/.X*-lock || true
rm -rf /tmp/.X11-unix/X* || true

export DISPLAY=:1
vncserver -kill :1 > /dev/null 2>&1 || true

echo "Setting up VNC..."
mkdir -p ~/.vnc

printf '#!/bin/bash\nstartxfce4 &\n' > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

# Write passwd file BEFORE vncserver starts
vncpasswd -f <<< "kali" > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

touch /home/kali/.Xauthority
chmod 600 /home/kali/.Xauthority

echo "Starting dbus..."
export $(dbus-launch) || true

echo "Starting VNC server..."
vncserver :1 \
  -geometry 1280x720 \
  -depth 16 \
  -SecurityTypes VncAuth \
  -PasswordFile ~/.vnc/passwd \
  -localhost no

echo "VNC started."
#tail -f ~/.vnc/*.log
sleep infinity
