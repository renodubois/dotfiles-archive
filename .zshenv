bindkey '^[[A' up-line-or-search # up arrow bindkey
bindkey '^[[B' down-line-or-search # down arrow 

# Add certs for LACRM setup
export CAROOT="/Users/renodubois/lacrm/LessAnnoyingCRM/certs"

# Set up fzf for vim fuzzy file search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set terminal colors
# export TERM=xterm-256color-italic

# Add NVM to PATH for scripting. Make sure this is the last PATH variable change.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/sbin:$PATH"
export JAVA_HOME="$(/usr/libexec/java_home)"