
#if [[ $(hostname) == 'mfyz-mbp.local' ]]; then
#  source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
#fi
if [[ $(hostname) == 'remote-workspace' ]] || [[ $(hostname) == 'mfyzw' ]]; then
  source ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme
fi

# CUSTOMIZATION

#POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{021}\u256D\u2500%F{white}"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" ❯ "
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{021}\u2570\u2500%F{white} "
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{021}\u2570❯%F{white} "

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=' '
POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS=''

# POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='none'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='214'

POWERLEVEL9K_DIR_ETC_BACKGROUND='none'
POWERLEVEL9K_DIR_ETC_FOREGROUND='033'
POWERLEVEL9K_DIR_HOME_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_FOREGROUND='033'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='033'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='none'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='033'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='none'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green3'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='none'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='red1'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='none'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='darkorange'

#POWERLEVEL9K_HOME_ICON='\uf7db'
#POWERLEVEL9K_HOME_SUB_ICON='\ue5fe'
#POWERLEVEL9K_FOLDER_ICON='\ue5fe'

POWERLEVEL9K_VCS_UNTRACKED_ICON='A'
POWERLEVEL9K_VCS_UNSTAGED_ICON='*'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='↓'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='↑'
POWERLEVEL9K_VCS_GIT_ICON='▲'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='▲'
POWERLEVEL9K_VCS_GIT_GITLAB_ICON='▲'
POWERLEVEL9K_VCS_BRANCH_ICON=''
POWERLEVEL9K_VCS_TAG_ICON='⸠'
POWERLEVEL9K_VCS_COMMIT_ICON='#'


