sudo docker build -t kali-vnc .

mkdir ~/.kali
sudo docker run -d -p 5901:5901 --name kali-vnc --privileged -it -v ~/.kali:/home/kali  kali-vnc /bin/bash


if [[ -f ~/.bashrc ]]; then
  echo 'alias startkali="sudo docker start kali-vnc"' >> ~/.bashrc
  echo 'alias stopkali="sudo docker stop kali-vnc"' >> ~/.bashrc
  echo 'alias runkali="sudo docker exec -it kali-vnc /bin/zsh"' >> ~/.bashrc
fi

if [[ -f ~/.zshrc ]]; then
  echo 'alias startkali="sudo docker start kali-vnc"' >> ~/.zshrc
  echo 'alias stopkali="sudo docker stop kali-vnc"' >> ~/.zshrc
  echo 'alias runkali="sudo docker exec -it kali-vnc /bin/zsh"' >> ~/.zshrc
fi


if [[ $SHELL == */zsh ]]; then
  source ~/.zshrc
else
  source ~/.bashrc
fi
