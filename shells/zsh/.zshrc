# If you come from bash you might have to change your $PATH.
source /usr/share/nvm/init-nvm.sh

# export MANPATH="/usr/local/man:$MANPATH"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
source ~/.config/.bash_aliases
eval $(thefuck --alias)
#
#
# Run 'nvm use' automatically when we change into 
# a directory that contains .nvmrc file and reverts
# to default if none present
_nvm_hook() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi
  
  PREV_PWD = $PWD
  if [[ -f ".nvmrc" ]]; then
    nvm use
    NVM_DIRTY=true
  elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
  fi


}

export PROMPT_COMMAND="$PROMPT_COMMAND; _nvm_hook"


eval "$(starship init zsh)"

# Install Ruby Gems to ~/gems'
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
