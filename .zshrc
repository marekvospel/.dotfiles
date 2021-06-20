### Zshell RC
### by vospel | v1

##
## Appereance
##

# Colors for commands
alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# Prefix
PS1='%F{004}%n:%~$%F{255} '

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


##
## Behaviour
##

# DONT FUCKING BEEP
unsetopt beep

# Terminal History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

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
VISUAL=vim
