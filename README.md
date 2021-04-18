
# Automatic Install

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/mfyz/dotfiles/master/install.sh)"`


# Manual config folders

Some of the config folders are not standard dotfiles, they may need to ne installed manually. Currently install.sh will skip folder names starting with underscore. See each folder for it's installation steps. Generally scripted.


## Install ZSH Plugins and Pl9k theme

```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k
```

## Vim Plugins
Install Vundle https://github.com/VundleVim/Vundle.vim with:
```git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```
Launch vim and run `:PluginInstall`


# Todos

[ ] Add vscode config files for mac https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/
[ ] Add bootstrap script that checks and install packages (node, npm, nvm, zsh etc...


# Tools used

- zsh + oh-my-zsh + powerlevel9k
- tmux for session/scree/pane management in cli
- fortune, cowsay, lolcatjs for daily inpirationals in motd

