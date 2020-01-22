#!/bin/sh
sudo apt update
sudo apt install git ranger git-extras zsh ccache neovim stow htop curl mpv cmatrix \
    clang gcc cmake make ninja-build build-essential doxygen libpcap-dev \
    wireshark openvpn network-manager-openvpn network-manager-openvpn-gnome \

stow -R zsh
stow -R nvim
stow -R regolith

mkdir -p ./antibody
curl -sfL git.io/antibody | sh -s - -b ~/dotfiles/antibody
chmod +x ~/dotfiles/antibody/antibody
~/dotfiles/antibody/antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless +PlugInstall +q

git submodule init
git submodule sync
git submodule update
git submodule foreach git checkout master
git submodule foreach git pull
