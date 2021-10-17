#!/bin/bash

#
# Variables
#

if [ -z "$HOME_PATH" ]; then
  HOME_PATH=$(echo ~)
fi

DOTFILES_PATH="$HOME_PATH"/.dotfiles

echo $HOME_PATH

zsh_install () {
	# link .zshrc & install custom plugins
	ln -sf "$DOTFILES_PATH"/.zshrc "$HOME_PATH"/.zshrc
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$DOTFILES_PATH"/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
}

vim_install () {
  # Copy vim plug into vim directory
  cp .vim-plug/plug.vim .vim/autoload/plug.vim
  
  # Copy .vim folder
  cp "$DOTFILES_PATH"/.vim "$HOME_PATH"/.vim -r

  # Link .vimrc
  ln -sf "$DOTFILES_PATH"/.vimrc "$HOME_PATH"/.vimrc

  # Install VimPlug
  vim +PlugInstall +qall
}

clone_repo () {
  git clone https://github.com/marekvospel/.dotfiles "$DOTFILES_PATH"
	cd "$DOTFILES_PATH"
	git submodule init
	git submodule update
}

clone_repo
zsh_install
vim_install

zsh && exit 0
