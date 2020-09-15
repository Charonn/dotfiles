# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/marcel/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
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
# export UPDATE_ZSH_DAYS=13

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
plugins=(git thefuck fzf zsh-autosuggestions zsh-syntax-highlighting ssh-agent)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -lha'
alias cd_adl='cd ~/workspace/adl'
alias cd_bb='cd ~/workspace/bb'
alias cd_gk='cd ~/workspace/gk'
alias cd_lw='cd ~/workspace/lw'
alias cd_on='cd ~/workspace/on'
alias cd_osp='cd ~/workspace/osp'
alias cd_spm='cd ~/workspace/spm'
alias cd_ahl='cd ~/workspace/ahl'
alias cd_jws='cd ~/workspace/jws'
alias cd_mop='cd ~/workspace/mop'
alias cd_ory='cd ~/workspace/ory'
alias cd_pnc='cd ~/workspace/pnc'
alias cd_hh='cd ~/workspace/hh'
alias screen_mono='xrandr --output DP-2-1 --off && xrandr --output DP-2-2 --off'
alias screen_triple='xrandr --output DP-2-2 --left-of DP-2-3 --auto && xrandr --output DP-2-1 --right-of DP-2-3 --auto'
alias eclipse='~/eclipse/jee-2018-12/eclipse/eclipse'
alias mvn8package='JAVA_HOME=/usr/lib/jvm/java-8-oracle/ mvn package'
alias mvn8test='JAVA_HOME=/usr/lib/jvm/java-8-oracle/ mvn test'
alias df='df -h'
alias du='du -h -c'
alias headset_hq='pacmd set-card-profile bluez_card.4C_87_5D_D0_25_AB a2dp_sink'
alias headset_mic='pacmd set-card-profile bluez_card.4C_87_5D_D0_25_AB headset_head_unit'
alias headset_reconnect="~/connect_bluetooth_headset.sh"
alias mono_mic='screen_mono && headset_mic'
alias triple_hq='screen_triple && headset_hq'
alias weather="curl wttr.in/Bochum"
alias zshconfig="vim ~/.zshrc"
alias sshconfig="vim ~/.ssh/config"

alias on_lan='(~/josca/osca_on_tu &> /dev/null &)'
alias on_lan_d356='(~/josca/osca_on_dynamics_tu &> /dev/null &)'
alias on_uat='(~/josca/osca_on_uat &> /dev/null &)'
alias on_prod='(~/josca/osca_on &> /dev/null &)'
alias jws_lan='(~/josca/osca_jws_tu &> /dev/null &)'
alias jws_uat='(~/josca/osca_jws_test &> /dev/null &)'
alias jws_prod='(~/josca/osca_jws &> /dev/null &)'
alias mop_lan='(~/josca/osca_mop_tu &> /dev/null &)'
alias mop_online='(JAVA_HOME=~/.sdkman/candidates/java/8.0.252-amzn javaws "https://www.osca-web-mop.com/webclient/mop/osca_mop.jnlp" &> /dev/null &)'
#alias mop_uat='(~/josca/osca_on_uat &> /dev/null &)'
#alias mop_prod='(~/josca/osca_on &> /dev/null &)'
alias ory_lan='(~/josca/osca_ory_tu &> /dev/null &)'
alias ory_uat='(~/josca/osca_ory_uat &> /dev/null &)'
alias ory_prod='(~/josca/osca_ory &> /dev/null &)'
alias osp_lan='(~/josca/osca_osp_tu &> /dev/null &)'
alias osp_prod='(~/josca/osca_osp &> /dev/null &)'
alias spm_lan='(~/josca/osca_spm_tu &> /dev/null &)'
alias spm_prod='(~/josca/osca_spm &> /dev/null &)'
alias bb_lan='(~/josca/osca_bb_tu &> /dev/null &)'
alias bb_prod='(~/josca/osca_bb &> /dev/null &)'
alias dc_tu='(~/josca/osca_dc_tu &> /dev/null &)'
alias hh_lan='(~/josca/osca_hh_tu &> /dev/null &)'
alias hh_uat='(~/josca/osca_hh_uat &> /dev/null &)'
alias hh_prod='(~/josca/osca_hh_prod &> /dev/null &)'

alias gw='(~/josca/Groupware &> /dev/null &)'
alias sip='(wine ~/Dokumente/MicroSIP-Lite-3.19.14/microsip.exe &> /dev/null &)'

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *.7z)             7zr e $1          ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

eval $(thefuck --alias)

unsetopt nomatch

export PATH=$PATH:/usr/lib/go-1.14/bin
export GOPATH=/home/marcel/go/

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/marcel/.sdkman"
[[ -s "/home/marcel/.sdkman/bin/sdkman-init.sh" ]] && source "/home/marcel/.sdkman/bin/sdkman-init.sh"
alias config='/usr/bin/git --git-dir=/home/marcel/.cfg/ --work-tree=/home/marcel'
