# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dev-user/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true 
DEFAULT_USER=$USER

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
source /home/dev-user/y/google-cloud-sdk/path.zsh.inc
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias python=python3.7
alias python3=python3.7
alias window_reload="source ~/.zshrc"

#source ~/powerlevel9k/powerlevel9k.zsh-theme
#source $HOME/.p9kgt

# Editor for crontab 
export EDITOR=vim
export FCEDIT=vim
export VISUAL=vim  

# 'ls' colors
eval $(dircolors -b)

# 'grep' colors
alias grep='grep --color=auto'
export GREP_COLOR="1;37"                    # white
#export GREP_COLOR="1;38;5;8"                # gray                         
#export GREP_COLOR="1;32"                    # green


alias ls='ls --color=auto --group-directories-first'  # add color, group dir
alias lsd='ls -lAtrh'                                 # sort by date
alias lsl='ls -lAh'                                   # long list, human-readabl
alias lss='ls -shAxSr'                                # sort by size
alias lsx='ls -lAhX'                                  # sort by extension
alias c='clear'                                       # clear screen
alias cp="cp -a"                                      # cp recursive, +perms
alias ebash="v ~/.bashrc"
alias sbash="source ~/.bashrc"

if [[ $(whoami) == root ]]; then
	  alias cds="cd $scrpt_dir/root && ls -h"; else
	    alias cds="cd $scrpt_dir && ls -h"
fi
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cda="cd ~/.arch/pkgbuild"
alias cdd="cd ~/Desktop && ls -h"
alias cdt="cd ~/.local/share/Trash/files && ls -h"
cdl () { cd "$(dirname "$(locate -i "$*" | head -n 1)")" ; } # locate then cd
cdf () { cd /mnt/sandfox/$(ls -t1 /mnt/sandfox/ | head -n 1)/home/todd ; }
cdc () { pwd > ~/.cdr       && echo " Cached current directory location" ; }
cdr () { cd "$(cat ~/.cdr)" && echo " Returned to cached directory location" ; }

# Dir: current working directory
prompt_dir() {
  prompt_segment blue white '%1~'
}

# git dot files
git_dot_files() {
	cp -r ~/.* ~/d/Projects/git/dot-files/
}

# activate venev
svnv() {
	source venv/bin/activate
}

alias ssh_gm='sudo ssh -i /mnt/c/Users/mural/Downloads/good_meals.pem ubuntu@52.66.12.89'

alias ssh_digital='sudo ssh -i /mnt/c/keys/digital.pem mdrip@139.59.77.167'

bq_mk(){
        bq mk -t --time_partitioning_type=DAY $1 $2
}


bq_show(){
        bq show --format=prettyjson $1
}

export DOCKER_HOST=tcp://localhost:2375

alias dkls="docker images --format 'table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedAt}}\t{{.Size}}'"

export PROJECT_ID="bikeninja-dwh-38964"

alias dkbld="docker build -t gcr.io/${PROJECT_ID}$1 ."

alias aws="sudo ssh -i /mnt/c/Users/mural/Downloads/good_meals.pem ubuntu@15.206.64.224 -Y"

alias scrapy="python -m scrapy"

alias doom="~/.emacs.d/bin/doom"

alias emax='
export DISPLAY=:0.0
export LIBGL_ALWAYS_INDIRECT=1
setxkbmap -layout us
setsid doom run
exit
'

alias explorer="explorer.exe"

alias hbb_central="pushd /mnt/d/Projects/misAutomation/hbb_central"

log_tail(){
        tail -n 1000 $1 | awk '/ERROR/ {print "\033[31m" $0 "\033[39m"} /INFO/ {print "\033[32m" $0 "\033[39m"}'
}
alias startup_services="sudo service cron restart & sudo service postfix restart"
