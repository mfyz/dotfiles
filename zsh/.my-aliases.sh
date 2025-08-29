#if [ $TERM_PROGRAM = "iTerm.app" ]; then
  #alias edit='if command -v windsurf &> /dev/null; then windsurf; else code; fi'
#else
  alias edit='vim'
#fi
alias e='edit'
alias s='sublime'
alias ll='/bin/ls'
alias lls='/bin/ls'
alias la='ls -a'
if command -v colorls &>/dev/null; then
  alias ls='colorls -lA --sd'
elif command -v lsd &>/dev/null; then
  alias ls='lsd -la'
fi
if [[ $(hostname) == "mfyzpi" ]]; then
 alias ls='lls -lah --group-directories-first --color' 
fi
alias pn='pnpm'
alias sublime='subl'
alias er='edit ~/.mybashrc'
alias sr='source ~/.mybashrc'
alias ezr='edit ~/.zshrc'
alias sza='source ~/.dotfiles/zsh/.my-aliases.sh'
alias eza='edit ~/.dotfiles/zsh/.my-aliases.sh'
alias esza='sublime ~/.dotfiles/zsh/.my-aliases.sh'
alias szr='source ~/.zshrc'
alias et='edit ~/.tmux.conf'
alias cst='less ~/.dotfiles/_cheatsheets/tmux.txt'
alias csv='less ~/.dotfiles/_cheatsheets/vim.txt'
alias gcdf='export BACK_TO_DIR=$(pwd); cd ~/.dotfiles; git add .; git commit -m"Auto commit"; git push; cd $BACK_TO_DIR'
#alias php5='/Applications/MAMP/bin/php/php5.4.45/bin/php'
#alias django-admin='python3 /Users/fatih/Library/Python/3.7/lib/python/site-packages/django/bin/django-admin.py'

alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tks='tmux kill-server'
alias tkss='tmux kill-session -t'
alias tcr='tmux source-file ~/.tmux.conf 2>&1 || echo "Tmux not running, config will be loaded on next start"'

alias cdnm='/usr/local/lib/node_modules/'
alias enable_charles='export http_proxy="http://127.0.0.1:8888";export https_proxy="http://127.0.0.1:8888"'
alias o='open .'
if command -v code-insiders &> /dev/null && ! command -v code &> /dev/null; then
  alias code='code-insiders'
fi
#alias c.='if command -v code-insiders &> /dev/null; then code-insiders .; else code .; fi'
# alias c.='code .'
alias c.='windsurf .'
alias ni='npm install'
alias nr='npm run'
alias ns='npm start'
alias nrs='npm start'
alias nrd='npm run dev'
alias nrc='npm run clean'
alias nrt='npm run test'
alias nrtu='npm run test:unit'
alias nrte='npm run test:e2e'
alias y='yarn'
alias ya='yarn add'
alias yi='yarn install'
alias ys='yarn start'
alias yr='yarn run'
alias yd='yarn dev'
alias js='jekyll serve --host=0.0.0.0'
alias dnsrestart='sudo killall -HUP mDNSResponder'

alias pew='sudo vim /etc/wpa_supplicant/wpa_supplicant.conf'
alias prw='sudo wpa_cli -i wlan0 reconfigure'
alias psw='sudo iwlist wlan0 scan | grep ESSID'

alias sshmndb='ssh -L 3310:localhost:3306 mn'

alias dc='docker compose'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcub='docker compose up --build'
alias dcd='docker compose down -v'
alias dcs='docker compose start'
alias dct='docker compose stop'
alias dwp="docker compose run --rm wpcli"
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
function gbDs(){
  export branch_to_delete=`git rev-parse --abbrev-ref HEAD`
  git checkout staging
  git branch -D $branch_to_delete
}
function gbDm(){
  export branch_to_delete=`git rev-parse --abbrev-ref HEAD`
  git checkout master
  git branch -D $branch_to_delete
}
alias gbdd='gbD && gpl'
alias gbsd='gbDs && gpl'
alias gbmd='gbDm && gpl'
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
alias gpl='git pull'
alias gch='git checkout'
alias sg='siktirgit'
alias hg='herokugit'
alias fg='firstgit'
alias ghb='gh browse'
alias gho='gh browse'

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

alias -g wsend='~/.wsend/wsend'
alias dm='ssh mfyz "cd /data/www/mfyz.com/wp-content/themes/mfyz; git pull"'

if [[ $(hostname) == "mfyzw" ]]; then
   alias o='explorer.exe'
   alias sublime='/mnt/c/Program\ Files\ \(x86\)/Sublime\ Text\ 3/subl.exe'
fi

alias d='icdiff'

# macos apache mysql
alias hosts='sudo vim /private/etc/hosts'
alias apache-start='sudo apachectl start'
alias apache-restart='sudo apachectl restart'
alias apache-stop='sudo apachectl stop'
alias apache-configtest='apachectl configtest'
alias apache-conf='sudo vim /etc/apache2/httpd.conf'
alias apache-vhost='sudo vim /private/etc/apache2/extra/httpd-vhosts.conf'
alias mysql-start='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysql-restart='sudo /usr/local/mysql/support-files/mysql.server restart'
alias mysql-stop='sudo /usr/local/mysql/support-files/mysql.server stop'
alias mysql-conf='sudo vim /etc/my.cnf'
alias php-ini='sudo vim /usr/local/etc/php/5.6/php.ini'

alias timer='termdown'
alias play-alert='afplay  /System/Library/Sounds/Sosumi.aiff'
function notify() {
  osascript -e "display notification \"$1 $2 $3 $4 $5 $6 $7 $8 $9\""
}
function notify-with-sound() {
  osascript -e "display notification \"$1 $2 $3 $4 $5 $6 $7 $8 $9\" sound name \"Hero\""
}
function t() {
  echo -n "Started: " && date
  echo "Duration: $1"
  timer -B $1 && notify-with-sound "${2-Timer is Done}" && echo -n "Finished: " && date
}

function ned(){
  OLD_IFS="$IFS"
  IFS='-'
  NED_FILE="$HOME/Desktop/$*.excalidraw.png"
  IFS=$OLD_IFS
  echo "Created $NED_FILE"
  touch $NED_FILE
  code -n $NED_FILE || eval "/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron -n $NED_FILE"
}

alias shp='shopify'
alias shs='shopify serve'
alias v='vercel'
alias vp='v --prod'
alias sq='steampipe query'
alias sqj='steampipe query --output json'
alias sqc='steampipe query --output csv'
alias create-gitignore='curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/main/Node.gitignore'
alias shdotenv='export $(grep -v "^#" .env | xargs)'
alias cds="cd ~/.ssh"
alias cdd="cd ~/Development"
alias cl="claude"
alias clp="claude --dangerously-skip-permissions"
alias clu="rm -rf /Users/fatih/.nvm/versions/node/v20.18.1/lib/node_modules/@anthropic-ai/claude-code && npm i -g @anthropic-ai/claude-code"
alias dfc="cd ~/.dotfiles"
alias dfpl="cd ~/.dotfiles && git pull"
alias dfps="cd ~/.dotfiles && git pull && git add . && git commit -m 'updates' && git push origin"
alias mr="ssh mr"

# Cross-platform cat alias using bat/batcat
if command -v batcat &> /dev/null; then
  alias cat='batcat'
elif command -v bat &> /dev/null; then
  alias cat='bat'
fi

# Clean up files/folders starting with DELETE_
clean_delete() {
    # Find files and directories starting with DELETE_ recursively
    local items=($(find . -name "DELETE_*" 2>/dev/null))
    
    if [ ${#items[@]} -eq 0 ]; then
        echo "No items found starting with DELETE_*"
        return 0
    fi
    
    echo "Found ${#items[@]} items to delete:"
    printf '%s\n' "${items[@]}"
    
    echo -n "Delete these items? (y/N): "
    read -r response
    
    if [ "$response" = "y" ]; then
        for item in "${items[@]}"; do
            if [ -d "$item" ]; then
                rm -rf "$item" && echo "Deleted directory: $item"
            elif [ -f "$item" ]; then
                rm -f "$item" && echo "Deleted file: $item"
            fi
        done
        echo "Cleanup complete!"
    else
        echo "Cancelled."
    fi
}
