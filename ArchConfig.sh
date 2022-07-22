#!/bin/bash

# base
sudo pacman -S git wget base-devel unzip 

# nvim
sudo pacman -S neovim
sudo ln -s $(which nvim) /usr/bin/vi
sudo ln -s $(which nvim) /usr/bin/vim

# archlinuxcn
sudo echo "" >> /etc/pacman.conf
sudo echo "" >> /etc/pacman.conf
sudo echo "[archlinux]" >> /etc/pacman.conf
sudo echo "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf
sudo pacman -Sy archlinuxcn-keyring

# fonts
sudo pacman -S noto-fonts-cjk
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d FiraCode
cd FiraCode
rm Fura*
rm FiraMono*
cd ..
sudo mv FiraCode/ /usr/share/fonts/
sudo fc-cache -f -v

# firefox
sudo pacman -S firefox

# alacritty
sudo pacman -S alacritty

# zsh
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k zsh-completions
sudo chsh -s /usr/bin/zsh
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
source ~/.zshrc && exit