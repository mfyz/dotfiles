
# Automatic Install

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/mfyz/dotfiles/master/install.sh)"`

# Pre-requisites:

- install zsh
- install ohmyzsh

# Other stuff to install
- Fig - Autocomplete
- Atuin - for better bash history: https://github.com/ellie/atuin

# Manual config folders

Some of the config folders are not standard dotfiles, they may need to ne installed manually. Currently install.sh will skip folder names starting with underscore. See each folder for it's installation steps. Generally scripted.


## Install ZSH Plugins and PowerLevel10k theme

```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

## Vim Plugins
Install Vundle https://github.com/VundleVim/Vundle.vim with:
```git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```
Launch vim and run `:PluginInstall`

## Install Ruby via rbenv
https://gist.github.com/stonehippo/cc0f3098516fb52390f1


# Todos

[ ] Add vscode config files for mac https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/
[ ] Add bootstrap script that checks and install packages (node, npm, nvm, zsh etc...


# Tools used

- zsh + oh-my-zsh + powerlevel10k
- tmux for session/scree/pane management in cli
- fortune, cowsay, lolcatjs for daily inpirationals in motd


# Other
Sublime Stuff
- Auto Hide Tabs: https://github.com/croach/SublimeHideTabs
- Markdown default: https://medium.com/@edgar/use-markdown-as-default-language-for-new-documents-in-sublime-text-3266471e01a4
- Clickable urls: https://stackoverflow.com/a/55172358
