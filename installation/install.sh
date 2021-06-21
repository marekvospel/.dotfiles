#!/bin/bash

USR=$(whoami)

pull() {
  if [ ! -d "$(eval echo ~$USR)"/.dotfiles/.git ]; then git clone https://github.com/marekvospel/.dotfiles; fi
  local WD=$(pwd)
  cd "$(eval echo ~$USR)"/.dotfiles
  git pull origin master
  cd "$WD"
}

backup() {
  if [ -f "$(eval echo ~$USR)"/.zshrc ]; then mv "$(eval echo ~$USR)"/.zshrc "$(eval echo ~$USR)"/.zshrc.old;  fi
  if [ -f "$(eval echo ~$USR)"/.vimrc ]; then mv "$(eval echo ~$USR)"/.vimrc "$(eval echo ~$USR)"/.vimrc.old;  fi
  if [ -d "$(eval echo ~$USR)"/.vim ];   then mv "$(eval echo ~$USR)"/.vim   "$(eval echo ~$USR)"/.vim.old -r; fi
}

links() {
  ln -sf "$(eval echo ~$USR)"/.dotfiles/.zshrc "$(eval echo ~$USR)"/.zshrc
  ln -sf "$(eval echo ~$USR)"/.dotfiles/.vimrc "$(eval echo ~$USR)"/.vimrc
  if [ ! -d "$(eval echo ~$USR)"/.dotfiles/.vim ]; then mkdir "$(eval echo ~$USR)"/.dotfiles/.vim; fi
  ln -sf "$(eval echo ~$USR)"/.dotfiles/.vim   "$(eval echo ~$USR)"/.vim
}

install() {
  curl -fLo "$(eval echo ~$USR)"/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir "$(eval echo ~$USR)"/.zinit -r
  git clone https://github.com/zdharma/zinit.git "$(eval echo ~$USR)"/.zinit/bin
}

apply() {
  vim +PlugInstall +qall
  chsh -s /bin/zsh "$USR"
}

if [ $# -gt 1 ]; then
  id "$1"
  if [ ! "$?" == 0 ]; then
    printf "Invalid user!\n"
    exit 22
  else
    $USER="$1"
  fi 
fi

pull
backup
links
install
apply
