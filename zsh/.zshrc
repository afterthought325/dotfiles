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
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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
alias vim='vim'
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
alias st='speedtest-cli'
alias internalip='ifconfig -a | awk '/broadcast/\''{print $2}'\'''
alias externalip='curl -s icanhazip.com'
alias zip='s 7z'
alias matrix='cmatrix -C cyan -abl'
alias chaisefarrar.com="mosh chaise@chaisefarrar.com"
alias wcfarrar.com="mosh chaise@wcfarrar.com"

#Pacman Aliases
alias pacin='packer -S'
alias pacd='packer -Syu'
alias pacrem='s pacman -Rs'

#Arrow-key interface
zstyle ':completion:*' menu select
source /usr/share/doc/pkgfile/command-not-found.zsh
