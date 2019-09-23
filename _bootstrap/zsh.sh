

echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "Add `zsh-syntax-highlighting` to your plugin list in zsh"


echo "Installing powerlevel9k"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo "Set zsh theme like `ZSH_THEME="powerlevel9k/powerlevel9k"` in zsh"


echo "Fetching secrets from dotfiles-secret repo"
git clone git@github.com:mfyz/dotfiles-secret.git ~/.dotfiles-secret

