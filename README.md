# .dotfiles
Welcome to my .dotfiles repository
This repository contains files like .zshrc, .vimrc etc.
  
This repository exists, so downloading & updating my .dotfiles is faster than moving files to & from a flash drive.
## Quick installation
```bash
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
```

