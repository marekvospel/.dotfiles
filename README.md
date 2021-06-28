# .dotfiles
Welcome to my .dotfiles repository
This repository contains files like .zshrc, .vimrc etc.
  
This repository exists, so downloading & updating my .dotfiles is faster than moving files to & from a flash drive.
## Quick installation
If you want to install my .dotfiles quickly you can use my install script with few options, so you don't have to go trough the prompts

```bash
curl https://raw.githubusercontent.com/marekvospel/.dotfiles/master/installation/install.sh -o dotfiles.sh; bash dotfiles.sh --all --backup; rm dotfiles.sh
```
## Installation
Installing my .dotfiles is easy, everything can be done with pacman / yay inspired installer install script.

The install script can be downloaded & started using following single line command
```bash
curl https://raw.githubusercontent.com/marekvospel/.dotfiles/master/installation/install.sh -o dotfiles.sh; bash dotfiles.sh; rm dotfiles.sh
```

If you don't want to use automatic installer, you can run following commands and install it yourself
```bash
# Install vim and zsh with your package manager
pacman -S vim zsh
apt-get install vim zsh

# Set zsh as your default shell
chsh -s /bin/zsh $(whoami)

# Install vim-plug & zinit
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.zinit
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin

# Clone this repository (Usually in your home directory)
git clone https://github.com/marekvospel/.dotfiles

# Go to where you clonned this repository (You can skip this sctep and instead of using $(pwd) you can enter path to where you clonned .dotfiles
cd ~/.dotfiles

# Link .dotfiles to your home directory, so when you pull latest commits, your dotfiles are automatically updated
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.vim ~/.vim

# Install vim-plug plugins
vim +PlugInstall +qall
```
