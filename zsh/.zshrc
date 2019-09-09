
export ZSH="/home/fatih/.oh-my-zsh"

ZSH_THEME="gnzh"

plugins=(git tmux)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false

source $ZSH/oh-my-zsh.sh


clear
echo
#landscape-sysinfo
echo "Welcome!"
echo
cd ~/Development


alias edit='vim'
alias lls='/bin/ls'
alias ls='exa -lh -T -L 1'
alias la='ls -a'

alias er='edit ~/.mybashrc'
alias sr='source ~/.mybashrc'
alias ezr='edit ~/.zshrc'
alias szr='source ~/.zshrc'
alias et='edit ~/.tmux.conf'

alias ai='sudo apt install'

alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'


export NVM_DIR="$HOME/.nvm"                                                                                                                                   
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm                                                                                            
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion   


