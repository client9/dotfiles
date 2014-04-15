#!/bin/bash

ln -fs "`pwd`/dot.emacs.el" ~/.emacs

mkdir -p ~/.emacs.d/site-lisp
ln -fs "`pwd`/dot.emacs.d/site-lisp" ~/.emacs.d/site-lisp

cd dot.emacs.d/site-lisp/
if [ ! -d go ]; then
  git clone https://github.com/dominikh/go-mode.el go
else
  cd go
  git pull
fi
