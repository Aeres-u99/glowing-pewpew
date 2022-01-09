#!/bin/env bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common neovim tmux zsh git gpg python3-pip python3-venv -y
curl --create-dirs https://raw.githubusercontent.com/Aeres-u99/dotfiles/master/nvim/init.vim > ~/.config/nvim/init.vim
# Configure for vim anyways 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Configure for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Configure Omz 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o/usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
docker -v
sudo groupadd docker
sudo useradd -m -s /bin/bash $USER
sudo usermod -aG docker $USER
docker run hello-world

