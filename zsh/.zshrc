
# zsh
#if [[ $(hostname) == "mfyz-mbp.local" ]]; then
export ZSH="/Users/fatih/.oh-my-zsh"
if [[ $(hostname) == "remote-workspace" ]]; then
  export ZSH="/home/fatih/.oh-my-zsh"
fi
if [[ $(hostname) == "mfyzpi" ]]; then
  export ZSH="/home/pi/.oh-my-zsh"
fi
#ZSH_THEME="gnzh"
ZSH_THEME="powerlevel9k/powerlevel9k"
source ~/.mfyz-powerlevel9k.sh
plugins=(
  git
  bundler
  # dotenv
  osx
  tmux
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
)
if [[ $(hostname) == "remote-workspace" ]]  || [[ $(hostname) == "mfyzpi" ]]; then
  ZSH_TMUX_AUTOSTART=true
  ZSH_TMUX_AUTOQUIT=false
fi
source $ZSH/oh-my-zsh.sh


# secrets
SECRETS_FILE="$HOME/.dotfiles-secret/secrets.sh"
if test -f "$SECRETS_FILE"; then
  source $SECRETS_FILE
fi


# custom aliases
source ~/.my-aliases.sh


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# env variables
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM="xterm-256color"

if [[ $(hostname) == "mfyz.local" ]]; then
  export PATH="/usr/local/lib/node_modules/node/bin:$PATH"
  export PATH="/usr/local/opt/php@7.2/bin:$PATH"
  export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
  export PATH="$HOME/.fastlane/bin:$PATH"
  export PATH="/usr/local/opt/python/libexec/bin:$PATH"
  export PATH="/usr/local/Cellar/python/3.7.4/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
  export PATH="$PATH:$HOME/.composer/vendor/bin"
  export ANDROID_HOME="/Users/fatih/Library/Android/sdk"
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export FASTLANE_HIDE_CHANGELOG=true
  # ruby via rbenv
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
  export JAVA_HOME=$(/usr/libexec/java_home)
  export PATH=$JAVA_HOME/bin:$PATH
fi


# Welcome message (motd)
if false; then
  clear
  echo
  #landscape-sysinfo
  #echo "Welcome!"
  fortune -a | cowthink -f tux | sed 's/^/  /' | lolcatjs
fi 

# put me in the right place!
if [[ $(pwd) == $(echo ~) ]] && [[ -d ~/Development ]]; then
  cd ~/Development
fi


[ -f "/Users/fatih/.shopify-app-cli/shopify.sh" ] && source "/Users/fatih/.shopify-app-cli/shopify.sh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/fatih/Development/serverless-nodejs-template/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/fatih/Development/serverless-nodejs-template/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/fatih/Development/serverless-nodejs-template/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/fatih/Development/serverless-nodejs-template/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/fatih/Development/serverless-nodejs-template/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/fatih/Development/serverless-nodejs-template/node_modules/tabtab/.completions/slss.zsh
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
alias -g wsend='/Users/fatih/.wsend/wsend'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
