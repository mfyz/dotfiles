alias edit='vim'
alias ll='/bin/ls'
alias lls='/bin/ls'
alias ls='exa -lh -T -L 1'
alias la='ls -a'
alias er='edit ~/.mybashrc'
alias sr='source ~/.mybashrc'
alias ezr='edit ~/.zshrc'
alias sza='source ~/.dotfiles/zsh/.my-aliases.sh'
alias eza='edit ~/.dotfiles/zsh/.my-aliases.sh'
alias szr='source ~/.zshrc'
alias et='edit ~/.tmux.conf'
alias cst='less ~/.dotfiles/_cheatsheets/tmux.txt'
alias csv='less ~/.dotfiles/_cheatsheets/vim.txt'

alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias ai='sudo apt install'
alias rn='react-native'
alias rnri='react-native run-ios'
alias rnra='react-native run-android'
alias rnli='react-native log-ios'
alias rnla='react-native log-android'
alias cdnm='/usr/local/lib/node_modules/'
alias enable_charles='export http_proxy="http://127.0.0.1:8888";export https_proxy="http://127.0.0.1:8888"'
alias c2p='python ~/Development/charles_to_postman/charles_to_postman.py'
alias o='open .'
alias c.='code .'
alias hl='heroku logs --tail'
alias jr='node /Users/fatih/Development/jira-reporter/index.js'
alias hc='hub create'
alias hb='hub browse'
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down -v'
alias dcs='docker-compose start'
alias dct='docker-compose stop'
alias nr='npm run'
alias nrd='npm run dev'
alias nrc='npm run clean'
alias nrt='npm run test'
alias dnsrestart='sudo killall -HUP mDNSResponder'

alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gb='git branch'
alias gbn='git checkout $(git rev-parse --abbrev-ref HEAD) -b'
unalias gbD > /dev/null 2>&1
function gbD(){
  export branch_to_delete=`git rev-parse --abbrev-ref HEAD`
  git checkout dev
  git branch -D $branch_to_delete
}
alias gbdd='gbD && gpl'
alias gbd='git checkout dev'
alias gbm='git checkout master'
alias grh='git reset --hard'
alias gp='git push'
alias gpf='git push --set-upstream origin master'
alias gpd='git pull origin dev'
alias gpdf='git pull origin dev:fatih -f'
alias gmd='git merge origin/dev'
alias gms='git merge origin/staging'
alias hp='herokugit'
alias gpl='git pull'
alias gch='git checkout'
alias sg='siktirgit'
alias hg='herokugit'
alias fg='firstgit'

function siktirgit(){
    git add .
    git commit -a -m "$1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $19 $19 $20"
    git push origin
}

function herokugit(){
    git add .
    git commit -a -m "$1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $18 $19 $20"
    currentBranch=$(git branch | grep \* | cut -d ' ' -f2)
    git push heroku $currentBranch:master
}

function firstgit() {
    git init
    git remote add origin $1
    git add .
    git commit -a -m "initial commit"
    git push --set-upstream origin master
}

function gc() {
    git clone $1
}
