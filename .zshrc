# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    docker
    docker-compose
    extract # Alias 'x'
    git
    tmux # Shortcuts ts and ta
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# trunc8 did this; Because Sem_Coursework was too big and slow to load
# https://gist.github.com/msabramo/2355834#gistcomment-2820263
# (Modified function in zsh source): Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
      ref=$(__git_prompt_git symbolic-ref HEAD 2> /dev/null) || \
      ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return 0
      echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
  fi
}

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# to obtain powerline symbols in tmux. The earlier hack was to use tmux -u. This forced the output to be UTF-8

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



# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.



## trunc8 did these

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Key mapping
xmodmap /home/trunc8/villa/Basement/.key_mapping

# ROS related
# source /opt/ros/melodic/setup.zsh
# source /usr/share/gazebo-9/setup.sh
# export TURTLEBOT3_MODEL=waffle
# source /home/trunc8/catkin_ws/devel/setup.zsh
# source /home/trunc8/catkin_ws/devel_cb/setup.zsh

# Swiss army knife; opens nearly everything
op() {
  if [[ "$1" == "" ]];
  then
    xdg-open . > /dev/null 2>&1
  else
    for file in "$@"
    do
      xdg-open "$file" > /dev/null 2>&1
    done
  fi
}

# export GAZEBOSIM_PATH=$HOME/villa/Basement/Model_Editor_Models/Gazebosim_Tutorial
# export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:~/catkin_ws/src/my_package/models:${GAZEBOSIM_PATH}:
# export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:${GAZEBOSIM_PATH}/Velodyne_LiDAR/Velodyne_Plugin/build:${GAZEBOSIM_PATH}/Gazebo_Plugin_Tutorial/build:${GAZEBOSIM_PATH}/Sensor_Tutorial/build:
# export LD_LIBRARY_PATH=/usr/local/lib:/home/trunc8/villa/Basement/Playground/f1tenth/lpopt_install/ThirdParty-HSL/coinhsl/lib:$LD_LIBRARY_PATH
# export WEBOTS_HOME=/usr/local/webots

eval "$(fasd --init auto)"

# Vim extension to the shell
set -o vi

# Must appear after the vim row in zshrc for fzf keybindings to work
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source /home/trunc8/.config/broot/launcher/bash/br

# Adding go to PATH
export GOPATH=$HOME/villa/Workspace/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Probably less (the pager tool) upgraded. LESS="-R" doesn't cut it anymore
# https://superuser.com/a/1514628
export LESS='--mouse --wheel-lines=3'
