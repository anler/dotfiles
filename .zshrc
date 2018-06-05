# Path to your oh-my-zsh installation.
export ZSH=/home/anler/.oh-my-zsh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.stack/programs/x86_64-linux/ghc-tinfo6-nopie-7.10.3/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export TERMINAL=gnome-terminal
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git tmux gpg-agent)

# ZSH_THEME="refined"
ZSH_THEME="juanghurtado"

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#
# Custom settings
#

alias reload="echo Reloading .zshrc...; source ~/.zshrc"

alias -g L="|less"
alias -g G="|grep -i"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs -Q --eval "(setq auto-save-default nil make-backup-files nil)"'
else
  export EDITOR='emacsclient -nw -s ~/.emacs.d/server'
fi

# ssh
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"


[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
[ -s "/usr/share/nvm/init-nvm.sh" ] && source /usr/share/nvm/init-nvm.sh # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
