#!/bin/bash

# Git clone and change dir to dotfiles (remote-install)
if [ "$(basename "$PWD")" != ".dotfiles" ]; then
	git clone https://github.com/mfyz/dotfiles.git ~/.dotfiles
	cd ~/.dotfiles || exit
fi

# Install stow if not installed
if ! command -v stow >/dev/null 2>&1; then
	if [[ -e /etc/debian_version ]]; then
		OS=debian
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		OS=macos
	elif  ! command -v stow >/dev/null 2>&1; then
		OS=notfound
	else
		echo "Please install stow manually then try again."
	fi

	if [[ "$OS" = 'debian' ]]; then
		sudo apt-get install -y stow
	elif [[ "$OS" = 'macos' ]]; then
		brew install stow
	fi
fi

# Run stow for all folders
for d in $(ls -d */ | cut -f1 -d '/' | grep -v '^_');
do
	if [ "$d" = "atuin" ]; then
		# force override
		stow "$d" --adopt
	else
		stow "$d"
	fi
done

echo '✔ All done!'
