#!/bin/sh -x
cp -f dot.gitconfig ~/.gitconfig
cp -f dot.bash_profile ~/.bash_profile

#
# SSH
#
mkdir -p ~/.ssh
cp -f ssh-config ~/.ssh/.config
cp -f id_rsa.pub ~/.ssh/id_rsa.pub

#
# VIM
#
cp dot.vimrc ~/.vimrc

if [ -d  ~/.vim/pack/plugins/start/vim-go ]; then
  cd ~/.vim/pack/plugins/start/vim-go && git pull
  echo "do vim :GoUpdateBinaries"
else
  git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
  echo "do vim :GoInstallBinaries"
fi

