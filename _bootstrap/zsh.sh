

echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "Add `zsh-syntax-highlighting` to your plugin list in zsh"


echo "Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo "Set zsh theme like `ZSH_THEME="powerlevel10k/powerlevel10k"` in zsh"


echo "Fetching secrets from dotfiles-secret repo"
git clone git@github.com:mfyz/dotfiles-secret.git ~/.dotfiles-secret

