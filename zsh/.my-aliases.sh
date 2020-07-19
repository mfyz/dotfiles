alias edit='vim'
alias ll='/bin/ls'
alias lls='/bin/ls'
alias la='ls -a'
if which colorls >/dev/null; then
  alias ls='colorls -lA --sd'
elif which exa >/dev/null; then
  alias ls='exa -lh -T -L 1'
fi
if [[ $(hostname) == "mfyzpi" ]]; then
 alias ls='lls -lah --group-directories-first --color' 
fi
alias er='edit ~/.mybashrc'
alias sr='source ~/.mybashrc'
alias ezr='edit ~/.zshrc'
alias sza='source ~/.dotfiles/zsh/.my-aliases.sh'
alias eza='edit ~/.dotfiles/zsh/.my-aliases.sh'
alias szr='source ~/.zshrc'
alias et='edit ~/.tmux.conf'
alias cst='less ~/.dotfiles/_cheatsheets/tmux.txt'
alias csv='less ~/.dotfiles/_cheatsheets/vim.txt'
alias gcdf='export BACK_TO_DIR=$(pwd); cd ~/.dotfiles; git add .; git commit -m"Auto commit"; git push; cd $BACK_TO_DIR'
alias php5='/Applications/MAMP/bin/php/php5.4.45/bin/php'
alias django-admin='python3 /Users/fatih/Library/Python/3.7/lib/python/site-packages/django/bin/django-admin.py'

alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias ai='sudo apt install'
alias rn='npx react-native'
alias rnri='npx react-native run-ios'
alias rnra='npx react-native run-android'
alias rnli='npx react-native log-ios'
alias rnla='npx react-native log-android'
alias cdnm='/usr/local/lib/node_modules/'
alias enable_charles='export http_proxy="http://127.0.0.1:8888";export https_proxy="http://127.0.0.1:8888"'
alias c2p='python ~/Development/charles_to_postman/charles_to_postman.py'
alias o='open .'
alias c.='code .'
alias hl='heroku logs --tail'
alias jr='node /Users/fatih/Development/jira-reporter/index.js'
alias hc='hub create'
alias hb='hub browse'
alias ni='npm install'
alias nr='npm run'
alias ns='npm start'
alias nrs='npm start'
alias nrd='npm run dev'
alias nrc='npm run clean'
alias nrt='npm run test'
alias js='jekyll serve --host=0.0.0.0'
alias dnsrestart='sudo killall -HUP mDNSResponder'

alias pew='sudo vim /etc/wpa_supplicant/wpa_supplicant.conf'
alias prw='sudo wpa_cli -i wlan0 reconfigure'
alias psw='sudo iwlist wlan0 scan | grep ESSID'

alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down -v'
alias dcs='docker-compose start'
alias dct='docker-compose stop'
alias dwp="docker-compose run --rm wpcli"
alias dcls="docker container ls"

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
alias gbsom='git branch --set-upstream-to=origin/master master'
alias gbsod='git branch --set-upstream-to=origin/dev dev'
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

function git_add_commit(){
    git add .
    git commit -a -m "$1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $19 $19 $20"
}

function siktirgit(){
    git_add_commit $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $19 $19 $20
    git push origin
}

function sgmr(){
    git_add_commit $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $19 $19 $20
	git push -o merge_request.create -o merge_request.target=dev -o merge_request.merge_when_pipeline_succeeds -o merge_request.remove_source_branch origin
}

function herokugit(){
	git_add_commit $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $19 $19 $20
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

function gbsu() {
	currentBranch=$(git branch | grep \* | cut -d ' ' -f2) 
	git branch --set-upstream-to=origin/$currentBranch $currentBranch 
}
