# .dotfiles
Welcome to my .dotfiles repository
This repository contains files like .zshrc, .vimrc etc.
  
This repository exists, so downloading & updating my .dotfiles is faster than moving files to & from a flash drive.
## Installation
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

# Clone this repository
https://github.com/marekvospel/.dotfiles

# move .dotfiles to your home directory
mv .zshrc ..
mv .vimrc ..
mv .vim/ .. -r

# For easier updating you can link them instead of moving them
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.vim. ~/.vim

# Install vim-plug plugins
vim +PlugInstall +qall
```

