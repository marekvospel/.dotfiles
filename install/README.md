# Installation



## Distribution dependent commands

### Arch Linux
You only need nvim & python nvim provider, which is in the community repository
```bash
sudo pacman -S neovim python-pynvim
```

## All distribution commands
The following commands can be run on any distribution which has the most common utilities installed.

```bash
mkdir ~/.config/nvim -p
ln -sf ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
```

### VimPlug
Download and install VimPlug
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# If you have VimPlug installed, you can just run the following commands
nvim +PlugInstall +qall
```
