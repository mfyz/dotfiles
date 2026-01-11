#!/bin/bash

# Git clone and change dir to dotfiles (remote-install)
if [ "$(basename "$PWD")" != ".dotfiles" ]; then
	git clone https://github.com/mfyz/dotfiles.git ~/.dotfiles
	cd ~/.dotfiles || exit
fi

# Check if stow is available, try to install if not
USE_MINISTOW=false
if ! command -v stow >/dev/null 2>&1; then
	if [[ -e /etc/debian_version ]]; then
		sudo apt-get install -y stow
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		brew install stow
	fi

	# If stow still not available, use ministow
	if ! command -v stow >/dev/null 2>&1; then
		echo "stow not available, using ministow fallback"
		USE_MINISTOW=true
	fi
fi

# Run stow/ministow for all folders
if [ "$USE_MINISTOW" = true ]; then
	./ministow.sh --all --adopt
else
	for d in $(ls -d */ | cut -f1 -d '/' | grep -v '^_');
	do
		if [ "$d" = "atuin" ]; then
			stow "$d" --adopt
		else
			stow "$d"
		fi
	done
fi

echo 'All done!'
