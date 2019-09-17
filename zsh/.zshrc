
# zsh
if [[ $(hostname) == "mfyz-mbp.local" ]]; then
  export ZSH="/Users/fatih/.oh-my-zsh"
elif [[ $(hostname) == "remote-workspace" ]]; then
  export ZSH="/home/fatih/.oh-my-zsh"
fi
#ZSH_THEME="gnzh"
ZSH_THEME="powerlevel9k/powerlevel9k"
source ~/.mfyz-powerlevel9k.sh
plugins=(
  git
  bundler
  dotenv
  osx
  tmux
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
)
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false
source $ZSH/oh-my-zsh.sh


# custom aliases
source ~/.my-aliases.sh


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# env variables
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export CODE_PUSH_ACCESS_KEY="f4a8947293f79d10c701ea3b457dff0eaf1a00a6"

if [[ $(hostname) == "mfyz-mbp.local" ]]; then
  export PATH="/usr/local/opt/php@7.2/bin:$PATH"
  export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
  export PATH="$HOME/.fastlane/bin:$PATH"
  export PATH="/usr/local/opt/python/libexec/bin:$PATH"
  export PATH="/usr/local/Cellar/python/3.7.4/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
  export ANDROID_HOME="/Users/fatih/Library/Android/sdk"
  export SLACK_CLI_TOKEN='xoxp-118588027139-119335193766-465504570466-06e79cfdad8826ab8dea06841fbc8720'
fi


# Welcome message (motd)
if true; then
  clear
  echo
  #landscape-sysinfo
  #echo "Welcome!"
  fortune -a | cowthink -f tux | sed 's/^/  /' | lolcatjs
fi 

# put me in the right place!
cd ~/Development


