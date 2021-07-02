bindkey '^[[A' up-line-or-search # up arrow bindkey
bindkey '^[[B' down-line-or-search # down arrow 

# Prompt setup
autoload -U promptinit
promptinit
prompt redhat

# Add fnm (node manager)
export PATH=/home/reno/.fnm:$PATH
eval "`fnm env`"

# Add certs for LACRM setup
export CAROOT="/home/reno/lacrm/LessAnnoyingCRM/certs"

# Set up fzf for vim fuzzy file search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set terminal colors
# export TERM=xterm-256color-italic

# fnm (replaces nvm)
export PATH=/home/reno/.fnm:$PATH
eval "`fnm env`"

# fix git status being slow
function git() {
	if $(pwd -P | grep -q "^\/mnt\/c\/*"); then
		git.exe "$@"
	else
		command git "$@"
	fi
}

export PATH=/home/reno/.bin:$PATH
export PATH=/home/reno/.local/bin:$PATH
export PATH=/mnt/c/Program\ Files/Git/bin:$PATH

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export GOPATH=/home/reno/go
export PATH=$GOPATH/bin:$PATH
. "$HOME/.cargo/env"
