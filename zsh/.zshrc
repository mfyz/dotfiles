# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# zsh
if [[ $(hostname) =~ "mfyz-air" || $(hostname) =~ "felix-air" ]]; then
  export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:$PATH
  export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
  export ZSH="/Users/fatih/.oh-my-zsh"
fi
if [[ $(hostname) == "remote-workspace" ]]; then
  export ZSH="/home/fatih/.oh-my-zsh"
fi
if [[ $(hostname) == "mfyzpi" ]]; then
  export ZSH="/home/pi/.oh-my-zsh"
fi
if [[ $(hostname) == "mfyzw" ]]; then
  export ZSH="/root/.oh-my-zsh"
fi
if [[ $(hostname) == "arc-C00636" ]]; then
  export ZSH="/Users/yildizf/.oh-my-zsh"
  export PATH=$HOME/bin:/usr/local/bin:$PATH
  export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
  export PATH="$HOME/Library/Python/3.8/bin:$PATH"
  export AWS_PROFILE=yildizm
fi
#ZSH_THEME="gnzh"
ZSH_THEME="powerlevel9k/powerlevel9k"
source ~/.mfyz-powerlevel9k.sh
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
if [[ $(hostname) == "remote-workspace" ]] || [[ $(hostname) == "mfyzpi" ]]; then
  ZSH_TMUX_AUTOSTART=true
  ZSH_TMUX_AUTOQUIT=false
fi
DISABLE_MAGIC_FUNCTIONS=true
ZSH_DISABLE_COMPFIX=true
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
# if installed from brew-x86
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"


# env variables
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM="xterm-256color"

if [[ $(hostname) =~ "felix-air" || $(hostname) =~ "mfyz-air" || $(hostname) =~ "arc-C00636" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/usr/local/lib/node_modules/node/bin:$PATH"
  export PATH="/usr/local/opt/php@7.2/bin:$PATH"
  export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
  export PATH="$HOME/.fastlane/bin:$PATH"
  export PATH="/usr/local/opt/python/libexec/bin:$PATH"
  export PATH="/usr/local/Cellar/python/3.7.4/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
  export PATH="/Users/fatih/Library/Python/3.9/bin:$PATH"
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
export PATH="/usr/local/mysql/bin:$PATH"

eval "$(atuin init zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
