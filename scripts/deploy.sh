#! /bin/bash

for f in .??*
  do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".DS_Store" ] && continue
    ln -snfv $(pwd)/$f $HOME/$f
  done

mkdir -p ~/.vim/tmp
