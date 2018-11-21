#!/bin/sh -x

cp -f dot.gitconfig ~/.gitconfig
cp -f dot.bash_profile ~/.bash_profile
mkdir -p ~/.ssh
cp -f id_rsa.pub ~/.ssh

