# Path to your oh-my-zsh installation.
export ZSH=/Users/kdodge/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="eastwood"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast mvn vi-mode aws kubectl history mvn you-should-use)

# User configuration

export PATH="/Users/kdodge/.jenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/Users/kdodge/.rvm/bin"
export PATH=$PATH:/usr/local/opt/ruby/bin
# export MANPATH="/usr/local/man:$MANPATH"

export ZSH=/Users/kdodge/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
#
# ------------------------------------- MY OWN STUFF -----------------------------------
export MAVEN_OPTS="-Xmx512m"

bindkey \^U backward-kill-line
bindkey \^H backward-kill-word
bindkey \^J delete-word
bindkey '^R' history-incremental-pattern-search-backward
bindkey "${terminfo[kcuu1]}" up-line-or-search
bindkey "${terminfo[kcud1]}" down-line-or-search

cdpath=( . /kapps/code/ax /kapps/code/core /kapps/code /kapps/kevin ~)

export EDITOR=/usr/local/bin/vim
export ALIANZA_HOME=/kapps/code
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home

export NVM_DIR="/Users/kdodge/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias mc="mvn-color clean"
alias mci="mvn-color clean install"
alias mcis="mvn-color clean install -Dmaven.test.skip=true -Dbasepom.check.skip-extended=true"
alias mciss="mvn-color clean install -Dmaven.test.skip=true -Dbasepom.check.skip-extended=true -Dbasepom.check.skip-basic=true"
alias mdt="mvn dependency:tree -U"
alias mdtv="mvn dependency:tree -U -Dverbose=true"

function dockerargs() {
    docker inspect $@ -f '{{json .Config.Env}}' | jq -r '.[] | select(startswith("JAVA_OPTS") or startswith("JAVA") != true) | sub("=";"=\"") + "\""' | tr '\n' ' '
}
