#!/bin/bash -x

ln -fs "`pwd`/dot.emacs.el" ~/.emacs

rm -rf ~/.emacs.d
mkdir -p ~/.emacs.d/site-lisp
cd ~/.emacs.d/site-lisp/
if [ ! -d go ]; then
  git clone https://github.com/dominikh/go-mode.el go
else
  cd go
  git pull
fi
