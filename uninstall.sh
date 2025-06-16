sudo docker rm kali-vnc
sudo docker rmi kali-vnc

sed -i '/alias startkali=/d' ~/.bashrc
sed -i '/alias stopkali=/d' ~/.bashrc
source ~/.bashrc