#!/bin/bash

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

git clone https://gitlab.com/Abdullah/cfg.git ~/cfg
cd ~/cfg || exit

for d in $(ls -d */ | cut -f1 -d '/');
do
	( stow "$d"  )
done

echo 'Congrats, you are done, Enjoy!'
