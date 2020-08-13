# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

#export fzf location for zsh plugin
export FZF_BASE=/usr/bin/fzf

# Antibody Configuration
source ~/.zsh_plugins.sh

#export QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

#Add cargo packages to path
export PATH=$PATH:"/home/farrar/.cargo/bin"

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
alias stest='speedtest-cli'
alias intip='ifconfig -a | awk '/broadcast/\''{print $2}'\'''
alias extip='curl -s icanhazip.com'
alias matrix='cmatrix -C cyan -ab'
alias chrono='stf=$(date +%s.%N);for ((;;));do ctf=$( date +%s.%N );echo -en "\r$(date -u -d "0 $ctf sec - $stf sec" "+%H:%M:%S.%N")";done'
alias chaisefarrar.xyz="mosh chaise@chaisefarrar.xyz"
#alias wcfarrar.com="mosh -ssh "ssh -p 4777"  chaise@wcfarrar.com"
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

anchor() {
    ANCHOR=$(pwd)    
    export ANCHOR
} 

antibody_update() {
    cwd=$(pwd)
    cd ~/dotfiles/antibody/
    ./antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
    echo "Updated ~/.zsh_plugins.sh"
    cd $cwd 
}

#Apt Aliases
alias pacin='sudo apt install'
alias pacd='sudo apt update && sudo apt upgrade'
alias pacrem='sudo apt remove'
alias searchfor='apt-cache search'

#Too Slow
#if [ -f /etc/os-release ]; then
#    . /etc/os-release
#    if [ "$ID" = "ubuntu" ]; then
#        alias pacin='sudo apt install'
#        alias pacd='sudo apt update && sudo apt upgrade'
#        alias pacrem='sudo apt remove'
#        alias searchfor='apt-cache search'
#    elif [ "$ID" = "archlinux" ]; then
#        alias pacin='sudo pacman -s'
#        alias pacd='sudo pacman -syu'
#        alias pacrem='sudo pacman -syu' #Need to remember this command
#    fi
#
#fi

# Base16 Shell
#BASE16_SHELL="$HOME/dotfiles/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"

#Command Completion
#autoload -Uz compinit
#if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
#	compinit;
#else
#	compinit -C;
#fi;

# Speeds up load time
DISABLE_UPDATE_PROMPT=true

# Perform compinit only once a day.
autoload -Uz compinit

setopt EXTENDEDGLOB
for dump in $ZSH_COMPDUMP(#qN.m1); do
  compinit
  if [[ -s "$dump" && (! -s "$dump.zwc" || "$dump" -nt "$dump.zwc") ]]; then
    zcompile "$dump"
  fi
  echo "Initializing Completions..."
done
unsetopt EXTENDEDGLOB
compinit -C

#Arrow-key interface
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
