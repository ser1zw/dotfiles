# -*- mode: sh-mode; coding: utf-8-unix -*-
#!/bin/bash

# $HOME に $HOME/dotfiles/files 以下のファイルのシンボリックリンクを追加
# すでに存在する場合はスキップ
LANG=C
RED="\033[0;31m"
GREEN="\033[0;32m"

DOT_FILES=`ls -a $HOME/dotfiles/files | grep -v '^\.\{1,2\}$'`

for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ]; then
    echo -e $RED"$HOME/$file already exists. Skipped."
  else
    ln -s $HOME/dotfiles/files/$file $HOME/$file && echo -e $GREEN"$HOME/$file successfully created."
  fi
done
