export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:$PATH
export PATH=$PATH:/opt/idea-IU-243.21565.193/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/opt/intellij-idea-ultimate-edition/bin
export PATH=$PATH:$HOME/google-cloud-sdk/bin
export XDG_CURRENT_DESKTOP=sway:dark
export GTK_THEME=Adwaita:dark  # Replace with your preferred dark theme
export QT_STYLE_OVERRIDE=Adwaita-dark  # Replace with your preferred dark theme
export WEBKIT_DISABLE_COMPOSITING_MODE=1
# Add these lines to your shell profile
export LUA_PATH='./?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua;/usr/share/lua/5.1/?.lua;/usr/share/lua/5.1/?/init.lua;/home/marcel/.luarocks/share/lua/5.1/?.lua;/home/marcel/.luarocks/share/lua/5.1/?/init.lua'
export LUA_CPATH='./?.so;/usr/local/lib/lua/5.1/?.so;/usr/lib/x86_64-linux-gnu/lua/5.1/?.so;/usr/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so;/home/marcel/.luarocks/lib/lua/5.1/?.so'


fpath+=(
    /usr/share/zsh/functions/Calendar
    /usr/share/zsh/functions/Chpwd
    /usr/share/zsh/functions/Completion
    /usr/share/zsh/functions/Completion/Base
    /usr/share/zsh/functions/Completion/Linux
    /usr/share/zsh/functions/Completion/Unix
    /usr/share/zsh/functions/Completion/X
    /usr/share/zsh/functions/Completion/Zsh
    /usr/share/zsh/functions/Exceptions
    /usr/share/zsh/functions/MIME
    /usr/share/zsh/functions/Math
    /usr/share/zsh/functions/Misc
    /usr/share/zsh/functions/Newuser
    /usr/share/zsh/functions/Prompts
    /usr/share/zsh/functions/TCP
    /usr/share/zsh/functions/VCS_Info
    /usr/share/zsh/functions/VCS_Info/Backends
    /usr/share/zsh/functions/Zftp
    /usr/share/zsh/functions/Zle
    /usr/lib/kitty/shell-integration/zsh/completions
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
DISABLE_MAGIC_FUNCTIONS=true

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting docker docker-compose zsh-kubectl-prompt autojump ssh-agent) # ssh agent
#RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
# Add a newline before each prompt
PROMPT=$'%{\n%}'"$PROMPT"
# Add a newline before each prompt
preexec() { print -P "" }

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
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
alias cd_scripts='cd ~/.local/share/DBeaverData/workspace6/General1/Scripts'
alias df='df -h'
alias du='du -h -c'
alias headset_reconnect="~/connect_bluetooth_headset.sh"
alias weather="curl wttr.in/Bochum"
alias zshconfig="vim ~/.zshrc"
alias sshconfig="vim ~/.ssh/config"
alias pull_all='find . -name ".git" -type d | sed "s/\/.git//" |  xargs -I{} bash -c "echo {} && git -C {} pull"'
alias gitm='gitmoji -c'
alias ide="~/Shell/tmux_vimide.sh"
alias tp_bug="~/Shell/tp_create_bug.sh"
alias tp_issue="~/Shell/tp_create.sh"
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh"

alias cpugetavail='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors'
alias cpushowcurrent='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cpusetperformace='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cpusetpowersave='echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'

alias ls=lsd
alias k=kubectl

alias sip='(wine ~/Dokumente/MicroSIP-Lite-3.19.14/microsip.exe &> /dev/null &)'
alias ideaLight='(idea -e &> /dev/null &)'
alias todos='(cat ~/commands.txt | grep "\[\]")'

alias protocol='(~/Shell/protokoll.sh)'
alias startup='(~/Shell/sway_startup.sh)'
alias mountTeamdraft='rclone mount teamdraft: /mnt/teamdraft --allow-non-empty --vfs-cache-mode writes --daemon'
alias tp='~/Shell/tp_create.sh'
sshCopyFileToClipboard(){
  ssh -n "$1" "cat $2" | xclip -selection c
}
startidea() {
    nohup idea.sh . > /dev/null 2>&1 &
}


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

#eval $(thefuck --alias)

unsetopt nomatch

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
fpath=(/usr/share/zsh/functions/Completion $fpath)
export _JAVA_AWT_WM_NONREPARENTING=1


bindkey -s ^f "$HOME/.tmux/tmux-sessionizer.sh\n"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

base16_espresso


if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -Uz compinit && compinit -u

if [ -f ~/.keys ]; then
    source ~/.keys
fi
source $HOME/.cargo/env

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mhufnagel/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mhufnagel/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mhufnagel/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mhufnagel/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


prompt_agnoster_main() {
  # Keep the existing agnoster theme prompt
  prompt_segment black default "%(!.%{%F{yellow}%}.)$USER@%m"
  prompt_segment blue $CURRENT_FG '%~'
  if [[ $RETVAL -ne 0 ]]; then
    prompt_segment red $CURRENT_FG '✘'
  fi

  # Add newline before the cursor
  prompt_segment black default "%(!.%{%F{yellow}%}.)%{\n%}"

  # Prepare the cursor position for the next line
  prompt_segment black default "➜"
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terragrunt terragrunt
