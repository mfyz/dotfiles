# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# zsh -----------------------------------------------------------------------------------------------------------------
if [[ "$(uname)" == "Darwin" ]]; then
  if [[ "$(hostname)" == "Mac" ]]; then
    HOSTNAME=$(networksetup -getcomputername)
  else
    HOSTNAME=$(hostname)
  fi
else
  HOSTNAME=$(hostname)
fi

if [[ $HOSTNAME =~ "mfyz-MBP" || $HOSTNAME =~ "felix-air" ]]; then
  export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:$PATH
  export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
  export ZSH="/Users/fatih/.oh-my-zsh"
  if [ -f "/Users/fatih/.config/op/plugins.sh" ]; then
    source "/Users/fatih/.config/op/plugins.sh"
  fi
  export GEM_HOME=$HOME/.gem
  export PATH=$GEM_HOME/bin:$PATH
fi
if [[ $HOSTNAME == "remote-workspace" || $HOSTNAME =~ "mfyz-server" ]]; then
  export ZSH="/home/fatih/.oh-my-zsh"
fi
if [[ $HOSTNAME == "mfyzpi" ]]; then
  export ZSH="/home/pi/.oh-my-zsh"
fi
if [[ $HOSTNAME == "mfyzw" ]]; then
  export ZSH="/root/.oh-my-zsh"
fi
if [[ $HOSTNAME == "arc-C02637" ]]; then
  export ZSH="/Users/yildizm/.oh-my-zsh"
  export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
  export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"
  # export PATH="$HOME/Library/Python/3.8/bin:$PATH"
  # export AWS_PROFILE=yildizm
  source $HOME/.okta/env-vars
  # alias clokta=okta-aws-cli -o $OKTA_ORG_DOMAIN -c $OKTA_OIDC_CLIENT_ID -e -b -z -s 43200
  alias clokta="sh ~/.source-okta.sh"
fi

export PATH="$HOME/.local/bin:$PATH"

#ZSH_THEME="gnzh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(
  git
  bundler
  # dotenv
  macos
  # tmux
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
)
if [[ $(hostname) == "remote-workspace" ]] || [[ $(hostname) == "mfyzpi" ]] || [[ $(hostname) == "mfyz-server" ]]; then
  ZSH_TMUX_AUTOSTART=true
  ZSH_TMUX_AUTOQUIT=false
fi
DISABLE_MAGIC_FUNCTIONS=true
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh


# secrets --------------------------------------------------------------------------------------------------------------
SECRETS_FILE="$HOME/.dotfiles-secret/secrets.sh"
if test -f "$SECRETS_FILE"; then
  source $SECRETS_FILE
fi


# custom aliases -------------------------------------------------------------------------------------------------------
source ~/.my-aliases.sh


# nvm ------------------------------------------------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# if installed from brew-x86
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"


# env variables --------------------------------------------------------------------------------------------------------
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM="xterm-256color"

# mac
if [[ $(hostname) =~ "felix-air" || $(hostname) =~ "mfyz-air" || $(hostname) =~ "arc-C00636" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/usr/local/lib/node_modules/node/bin:$PATH"
  export PATH="/usr/local/opt/php@7.2/bin:$PATH"
  export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
  export PATH="$HOME/.local/bin:$PATH"
  export PATH="$HOME/.fastlane/bin:$PATH"
  # export PATH="/usr/local/opt/python/libexec/bin:$PATH"
  # export PATH="/usr/local/Cellar/python/3.7.4/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
  # export PATH="/Users/fatih/Library/Python/3.9/bin:$PATH"
  export PATH="$PATH:$HOME/.composer/vendor/bin"
  export ANDROID_SDK=$HOME/Library/Android/sdk
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export FASTLANE_HIDE_CHANGELOG=true
  # ruby via rbenv 
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
  #export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
  #export PATH="/usr/local/opt/ruby@2.7/bin:$PATH"
  #export LDFLAGS="-L/usr/local/opt/ruby@2.7/lib"
  #export CPPFLAGS="-I/usr/local/opt/ruby@2.7/include"
  export JAVA_HOME=$(/usr/libexec/java_home)
  export PATH=$JAVA_HOME/bin:$PATH
  export GEM_HOME="$HOME/.gem"
  export EDITOR='code'
fi

if [[ $(hostname) == "mfyzw" ]]; then
  export PATH=$PATH:/root/.cargo/bin
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

alias -g wsend='/Users/fatih/.wsend/wsend'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"

[[ -f "$HOME/.atuin/bin/env" ]] && . "$HOME/.atuin/bin/env"
[[ -x "$(command -v atuin)" ]] && eval "$(atuin init zsh)"

# Added by Windsurf
export PATH="/Users/fatih/.codeium/windsurf/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/fatih/.lmstudio/bin"

