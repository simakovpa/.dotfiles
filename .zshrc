# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/toli4/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
zstyle ':completion:*' rehash true

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
plugins=(git)

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#
# SSH for Github Push
#

# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.

env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

if ! agent_is_running; then
    agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa or ~/.ssh/id_dsa, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
    agent_start
    ssh-add
elif ! agent_has_keys; then
    ssh-add
fi

unset env

# SSH Github agent set End

source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alias upd='sudo pacman -Syyuu'
alias upd='sudo apt update && sudo apt dist-upgrade -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y'
alias ytd='cd ~/Videos && youtube-dl -ctif 22 '
alias yad='cd ~/Music && youtube-dl -Acit '
alias mcpeserver='cd ~/Minecraft/BedrockServer && ./bedrock_server'
alias mcpe3server='cd ~/Minecraft/BedrockServer_3 && ./bedrock_server'
alias minecraftpe='cd ~/Minecraft/mcpelauncher_new && ./Minecraft_Bedrock_Launcher-253763c-x86_64.    AppImage'i
alias mcjava_server='cd /home/pavel/Minecraft/SpygotServer2 && ./start.sh'
alias mcrcon_console='/opt/minecraft/tools/mcrcon/mcrcon -H 127.0.0.1 -P 25575 -p toli4_admin -t'
alias ytdmylist="cd ~/Videos && youtube-dl -ctif 22 https://www.youtube.com/playlist?list=PL2cc3SFLm44agbvtqmU6McupwdIzDkJwP"
alias shcfg='vim ~/.bashrc'
alias mcjava_start='cd ~/Downloads/TLauncher-2.69 && java -jar TLauncher-2.69.jar'
alias ubclean='sudo apt autoclean && sudo apt clean && sudo apt autoremove'
alias ortho4xp='cd /home/pavel/Downloads/Ortho4XP-1.20b/ && python3 Ortho4XP_v120b.py'
alias covid19='cd ~/Downloads/ && python3 COVID19.py'
alias zcfg='vim ~/.zshrc'
alias todoist='cd todoist-linux && make up'
alias homm3='cd ~/.winegames/heroes/drive_c/Heroes3 && env WINEPREFIX=$HOME/.winegames/heroes wine "Heroes3.exe"'
alias diablo2='cd "~/.winegames/diablo2/drive_c/Diablo II - Lord of Destruction" && env WINEPREFIX=$HOME/.winegames/diablo2 wine "Game.exe"'
alias mcrcon='cd ~/tools/mcrcon && ./mcrcon -H 127.0.0.1 -P 25575 -p toli4_admin -t'
alias pulseaudio-restart='pulseaudio -k && pulseaudio --start'
alias manjaro_clean_cache='sudo pacman -Sc && sudo pacman -Rs $(pacman -Qqdt)'
alias pacman_delete_package_correct='sudo pacman -Rsn'
alias size_files_in_dir='du sch ./*'
alias ll='ls -lah'
alias addkey='eval $(ssh-agent) && ssh-add'
alias grub_upd='sudo grub-mkconfig -o /boot/grub/grub.cfg'
