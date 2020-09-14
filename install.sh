# fresh boot of ubuntu/debian
#
# prereq: ssh key configured

sudo apt -y update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove

# install goodies
sudo apt -y update && sudo apt -y install git tmux zsh vim fzf fasd ripgrep curl

# docker
sudo apt -y update && sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt -y update && sudo apt -y install docker-ce docker-ce-cli containerd.io

# golang
#git clone https://go.googlesource.com/go /usr/local/src/go
#cd /usr/local/src/go
#wget https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz
#tar -xzvf TODO
#https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz
#cd /usr/local/src/go/src && git checkout go1.14.2 && ./make.bash

# zsh (do before linking .zshrc, no update prompt)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TODO download raw dotfiles to right place
git clone git@github.com:rdallman/dotfiles $HOME/.dotfiles
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.vimrc ~/.vimrc
source ~/.zshrc ~/.gitconfig ~/.tmux.conf ~/.vimrc

# install plugins
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
vim -es -i NONE -c "GoInstallBinaries" -c "qa"

# dev stuff
mkdir -p $HOME/dev/gocode


