sudo docker build -t kali-vnc .
sudo docker run -d -p 5901:5901 --name kali-vnc --privileged  kali-vnc

echo 'alias startkali="sudo docker start kali-vnc"' >> ~/.bashrc
echo 'alias stopkali="sudo docker stop kali-vnc"' >> ~/.bashrc
source ~/.bashrc
