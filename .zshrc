### Zshell RC
### by vospel | v1.1



ZSH=~/.dotfiles/.oh-my-zsh
DOTFILES_PATH=~/.dotfiles

##
## Plugins
##

# oh my zsh
plugins=(ssh-agent sudo zsh-syntax-highlighting)

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa

source $ZSH/oh-my-zsh.sh

##
## Appereance
##

# Colors for commands
alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'

# Prefix
precmd() {
  source $DOTFILES_PATH/.zsh_prefix
}

##
## Behaviour
##

# DONT FUCKING BEEP
unsetopt beep

# Auto cd
setopt auto_cd

# Terminal History
HISTFILE=~/.zsh_history
HISTSIZE=1000

# Keybinds
bindkey "^[[H"    beggining-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[3~"   delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H"      backward-kill-word
bindkey "5~"      kill-word

# Character encoding
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias la='ls -al'

# Default editor
EDITOR=vim
VISUAL=gvim

