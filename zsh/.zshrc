#Antigen Settings
source ~/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle python

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# gitflow
antigen bundle bobthecow/git-flow-completion

# Load the theme.
antigen theme amuse

# Tell antigen that you're done.
antigen apply

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

#Add Home Bin Folder to PATH
export PATH=$PATH:"~/bin"

#Export GOPATH
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf

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

# Aliases
alias e='exit'
alias x='startx'
alias s='sudo'
alias ip='s ip'
alias vi='sudo vim'
alias svim='sudo vim' alias vimi='vim -c 'startinsert' '
alias reboot='s reboot'
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.config/nvim/init.vim"
alias poweroff='s poweroff'
alias n="nano"
alias sn="sudo nano"
alias mount='s mount'
alias lsl='ls -lh'
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
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"; ls'
alias restartgnome="dbus-send --type=method_call --print-reply --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'global.reexec_self()'"
alias c++tags='ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q '
alias ctagsgit="ctags -R -f ./.git/tags"
alias NO='sudo $(history -p \!\!)'
alias stest='speedtest-cli'
alias intip='ifconfig -a | awk '/broadcast/\''{print $2}'\'''
alias extip='curl -s icanhazip.com'
alias matrix='cmatrix -C cyan -ab'
alias chrono='stf=$(date +%s.%N);for ((;;));do ctf=$( date +%s.%N );echo -en "\r$(date -u -d "0 $ctf sec - $stf sec" "+%H:%M:%S.%N")";done'
alias chaisefarrar.xyz="mosh chaise@chaisefarrar.xyz"
alias wcfarrar.com="mosh -ssh "ssh -p 4777"  chaise@wcfarrar.com"
alias ytdl='youtube-dl -f bestvideo+bestaudio'
twitch () { mpv --ytdl "https://twitch.tv/$1"; }
alias mpvplay='livestreamer --player mpv --default-stream best'
alias bigbandradio='mpv http://199.189.111.28:8012/listen.pls' #www.1940sradio.com
alias rocketradio='mpv http:\/\/live.wostreaming.net\/playlist\/southernstone-wrttaac-ibc1.m3u\?type=.flv' #Rocket 95.1
alias maze='clear; while true; do (( $RANDOM % 2 )) && echo -n ╱ || echo -n ╲; sleep 0.07; done'
ChangeGoPath () {
    export GOPATH=${PWD}
    export GOBIN=$GOPATH/bin
    export PATH=$PATH:$GOPATH
}
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


##Pacman Aliases
#alias pacin='yaourt -Sa'
#alias pacd='yaourt -Syua'
#alias pacrem='sudo pacman -Rs --color=auto'
#alias searchfor='yaourt -Ssa'
#pacro() {
#    if [[ ! -n $(pacman -Qdt) ]]; then
#        echo "No orphans to remove."
#    else
#        sudo pacman -Rns $(pacman -Qdtq)
#    fi
#    }
#    
#pacman-size() {
#    CMD="pacman -Si"
#	SEP=": "
#	TOTAL_SIZE=0
#	
#	RESULT=$(eval "${CMD} $@ 2>/dev/null" | awk -F "$SEP" -v filter="Size" -v pkg="^Name" \
#	  '$0 ~ pkg {pkgname=$2} $0 ~ filter {gsub(/\..*/,"") ; printf("%6s KiB %s\n", $2, pkgname)}' | sort -u -k3)
#	
#	echo "$RESULT"
#	
#	## Print total size.
#	echo "$RESULT" | awk '{TOTAL=$1+TOTAL} END {printf("Total : %d KiB\n",TOTAL)}'
#    }

#Apt Aliases
alias pacin='sudo apt install'
alias pacd='sudo apt update && sudo apt install'
alias pacrem='sudo apt remove'
alias searchfor='apt-cache search'

# Base16 Shell
#BASE16_SHELL="$HOME/dotfiles/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"

#Command Completion
autoload -Uz compinit
compinit

#Arrow-key interface
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
