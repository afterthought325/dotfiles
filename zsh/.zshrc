# Path to your oh-my-zsh installation.
export ZSH=/home/chaise/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kardan"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=4

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

#Automatically cd to directory stated ex. cd foo == foo
setopt AUTO_CD

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"

#export DEFAULT_USER = chaise

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Aliases
alias e='exit'
alias x='startx'
alias s='sudo'
alias ip='s ip'
alias vi='sudo vim'
alias svim='sudo vim'
alias vimi='vim -c 'startinsert' '
alias reboot='s reboot'
alias poweroff='s poweroff'
alias n="nano"
alias sn="sudo nano"
alias mount='s mount'

#Systemctl Aliases
alias services='systemctl'
alias startser='s systemctl start'
alias stopser='s systemctl stop'
alias enableser='s systemctl enable'
alias disableser='s systemctl disable'
alias restartser='s systemctl restart'
alias statusser='systemctl status'
alias timersser='systemctl list-timers'
alias rebootsysd='s systemctl daemon-reload'


#compton
alias retrans='killall compton; compton -b --config ~/.compton.conf'

# Terminal shortcuts
alias ls='ls --color=auto --group-directories-first'
alias cp='cp -v'
alias NO='sudo $(history -p \!\!)'
alias st='speedtest-cli'
alias intip='ifconfig -a | awk '/broadcast/\''{print $2}'\'''
alias extip='curl -s icanhazip.com'
alias zip='s 7z'
alias matrix='cmatrix -C cyan -abl'
alias chaisefarrar.com="mosh chaise@chaisefarrar.com"
alias wcfarrar.com="mosh -ssh "ssh -p 4777"  chaise@wcfarrar.com"
alias ytdl='youtube-dl -f bestvideo+bestaudio'
twitch () { mpv --ytdl "https://twitch.tv/$1"; }
alias mpvplay='livestreamer --player mpv --default-stream best'
alias radio='mpv http://stream2138.init7.net:80'
alias maze='clear; while true; do (( $RANDOM % 2 )) && echo -n ╱ || echo -n ╲; sleep 0.07; done'
#Mount and Unmount shortcuts
m () {
    echo udevil mount /dev/$1
    udevil mount /dev/$1
    echo mounted media:
    LANG=C grep --color=auto media =(mount)
}

u () {
    echo udevil umount /dev/$1
    udevil umount /dev/$1
    if [[ $1 = sr0 ]]
    then
        echo eject /dev/sr0
        eject /dev/sr0
    fi
    echo mounted media:
    LANG=C grep --color=auto media =(mount)
}

# Easy extract
extract () {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       rar x $1       ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi}

anchor() {
    ANCHOR=$(pwd)    
    export ANCHOR
    } 


#Pacman Aliases
pacin () {
    packer-color -S $1
    installdate=$(date +"%Y-%m-%d") 
    echo -e "$installdate Installed package $1" >> /home/chaise/My_changelog.txt 
    }
pacrem () {
    sudo pacman -Rs --color=auto $1
    removedate=$(date +"%Y-%m-%d") 
    echo -e "$removedate Removed package $1" >> /home/chaise/My_changelog.txt 
    }
pacro() {
    if [[ ! -n $(pacman -Qdt) ]]; then
        echo "No orphans to remove."
    else
        sudo pacman -Rns $(pacman -Qdtq)
    fi
    }
    
pacman-size() {
    CMD="pacman -Si"
	SEP=": "
	TOTAL_SIZE=0
	
	RESULT=$(eval "${CMD} $@ 2>/dev/null" | awk -F "$SEP" -v filter="Size" -v pkg="^Name" \
	  '$0 ~ pkg {pkgname=$2} $0 ~ filter {gsub(/\..*/,"") ; printf("%6s KiB %s\n", $2, pkgname)}' | sort -u -k3)
	
	echo "$RESULT"
	
	## Print total size.
	echo "$RESULT" | awk '{TOTAL=$1+TOTAL} END {printf("Total : %d KiB\n",TOTAL)}'
    }

    
#alias pacin='packer -S'
alias pacd='packer-color -Syu'
#alias pacrem='s pacman -Rs'

#Arrow-key interface
zstyle ':completion:*' menu select
#source /usr/share/doc/pkgfile/command-not-found.zsh
