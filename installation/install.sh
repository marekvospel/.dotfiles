#!/bin/bash

#
# Colors
#

blue="\x1b[34m"
red="\x1b[31m"
bold="\x1b[1m"
reset="\x1b[0m"

#
# Variables
#

usr=$(whoami) # Defaultly set to user who is running the script
use_sudo=false # Defaultly can't use sudo

customize_zsh='u' # Defaultly undefined
customize_vim='u' # Defaultly undefined

zsh_present=false # Defaultly not present
vim_present=false # Defaultly not present

backup_dotfiles='u' # Defaultly backup dotfiles

#
# Functions
#

usage() {
	printf "
Usage: $0 [option]

Options:
\t-h, --help\t\tShow usage of this script
\t-u, --user [user]\tChange user who those dotfiles will be installed for.
"
}

#
# Read arguments
#

while [ "$#" -gt 0 ]; do
	case "$1" in
		-h | --help)
			shift
			usage
			exit 0
			;;
		-u | --user)	
			shift
			if [ $# -le 0 ]; then
				printf "$red->$reset Missing user!\n"
				usage
				exit 22
			fi
			usr="$1"
			;;
		*)
			shift
			;;
	esac
done

#
# User checking
#

id "$usr" &>/dev/null

if [ "$?" != 0 ]; then
	printf "$red->$reset User $usr doesn't exist!\n"
	exit 22
fi

if [ $(whoami) != "$usr" ] && [ "$EUID" != 0 ]; then
	sudo test
  if [ "$?" != 0 ]; then 
		printf "$red->$reset Can't install .dotfiles for this user!\n"
		exit 1
 	fi	
	use_sudo=true
fi

home="$(eval printf $(echo ~$usr))"
printf "$blue::$reset$bold Installing for user $usr!$reset\n"

# 
# Package lookup
#

printf "$blue::$reset$bold Looking for customizable packages...$reset\n"

if [ -a /usr/bin/zsh ] || [ -a /bin/zsh ]; then
	zsh_present=true
	printf "Found zsh!\n"
fi

if [ -a /usr/bin/vim ] || [ -a /usr/bin/vim ]; then
	vim_present=true
	printf "Found vim!\n"
fi

#
# Script options prompt
#

if "$zsh_present" && [ "$customize_zsh" == 'u' ]; then
	printf "$blue::$reset$bold Do you want your zsh to be customized? [Y/n]$reset "
	read customize_zsh
	if [ "$customize_zsh" != 'y' ] && [ "$customize_zsh" != 'Y' ] && [ "$customize_zsh" != '' ]; then customize_zsh='n'; fi	
fi

if "$vim_present" && [ "$customize_vim" == 'u' ]; then
	printf "$blue::$reset$bold Do you want your vim to be customized? [Y/n]$reset "
	read customize_vim
	if [ "$customize_vim" != 'y' ] && [ "$customize_vim" != 'Y' ] && [ "$customize_vim" != '' ]; then customize_vim='n'; fi	
fi

if [ "$backup_dotfiles" == 'u' ]; then
	printf "$blue::$reset$bold Do you want to backup your old .dotfiles? [Y/n]$reset "
	read backup_dotfiles
	if [ "$backup_dotfiles" != 'y' ] && [ "$backup_dotfiles" != 'Y' ] && [ "$backup_dotfiles" != '' ]; then backup_dotfiles='n'; fi
fi

#
# Detect old dotfiles folder and update / download it
#

if [ -d "$home/.dotfiles" ] && [ -d "$home/.dotfiles/.git" ]; then
	printf "$blue::$reset$bold Found .dotfiles repo in $home/.dotfiles. Pulling to get latest version!$reset\n"
	if "$use_sudo"; then
		sudo git "--git-dir=$home/.dotfiles/.git/" pull origin master
	else
		git "--git-dir=$home/.dotfiles/.git/" pull origin master
	fi
else 
	printf "$blue::$reset$bold There is no .dotfiles repo in $home/.dotfiles. Clonning to the latest version from git!$reset\n"
	if "$use_sudo"; then
		sudo git clone https://github.com/marekvospel/.dotfiles.git "$home/.dotfiles"
	else
		git clone https://github.com/marekvospel/.dotfiles.git "$home/.dotfiles"
	fi
fi

#
# Backup old dotfiles
#

if [ "$backup_dotfiles" != 'n' ]; then
	printf "$blue::$reset$bold Backing up old dotfiles...\n"

	# zsh
	if [ "$customize_zsh" != 'n' ] && [ -a "$home/.zshrc" ]; then	
		if "$use_sudo"; then
			sudo mv "$home/.zshrc" './zshrc.old'
		else
			mv "$home/.zshrc" './zshrc.old'
		fi
	fi

	# vim
	if [ "$customize_vim" != 'n' ] && [ [ -a "$home/.vimrc" ] || [ -a "$home/.vim" ] ]; then
		if [ -a "$home/.vimrc" ]; then
			if "$use_sudo"; then
				sudo mv "$home/.vimrc" './vimrc.old'
			else
				mv "$home/.vimrc" './vimrc.old'
			fi
		fi
			
		if [ -a "$home/.vim" ]; then
			if "$use_sudo"; then
				sudo mv "$home/.vim" './vim.old'
			else
				mv "$home/.vim" './vim.old'
			fi
		fi	
	fi

fi

#
# Zsh customization
#

if [ "$customize_zsh" != 'n' ]; then
	printf "$blue::$reset$bold Installing Zsh customization...$reset\n"	

	if "$use_sudo"; then
		sudo mkdir "$home/.zinit" -p
		sudo git clone https://github.com/zdharma/zinit.git "$home/.zinit/bin"
		sudo ln -sf "$home/.dotfiles/.zshrc" "$home/.zshrc"
		sudo chsh -s /bin/zsh "$usr"	
	else
		mkdir "$home/.zinit" -p
		git clone https://github.com/zdharma/zinit.git "$home/.zinit/bin"
		ln -sf "$home/.dotfiles/.zshrc" "$home/.zshrc"
		chsh -s /bin/zsh "$usr"
	fi	
	
fi

#
# Vim customization
#

if [ "$customize_vim" != 'n' ]; then
	printf "$blue::$reset$bold Installing vim customization...$reset\n"

	if "$use_sudo"; then
		sudo curl -fLo "$home/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		sudo ln -sf "$home/.dotfiles/.vimrc" "$home/.vimrc"
		if [ ! -d "$home/.dotfiles/.vim" ]; then sudo mkdir "$home/.dotfiles/.vim"; fi
		sudo ln -sf "$home/.dotfiles/.vim" "$home/.vim"
		sudo vim +PlugInstall +qall	
	else
		curl -fLo "$home/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		ln -sf "$home/.dotfiles/.vimrc" "$home/.vimrc"
		if [ ! -d "$home/.dotfiles/.vim" ]; then mkdir "$home/.dotfiles/.vim"; fi
		ln -sf "$home/.dotfiles/.vim" "$home/.vim/"
		vim +PlugInstall +qall	
	fi
fi

#
# All done
#

printf "$blue::$reset$bold Marek Vospel's dotfiles have been successfully installed!$reset\n"
