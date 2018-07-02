# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.stack/programs/x86_64-linux/ghc-tinfo6-nopie-7.10.3/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export TERMINAL=urxvt
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_VARIANT=altgr-intl
export XKB_DEFAULT_OPTIONS=ctrl:nocaps

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git tmux gpg-agent)

# ZSH_THEME="refined"
# ZSH_THEME="juanghurtado"
# ZSH_THEME="mgutz"
# ZSH_THEME="funky"
# ZSH_THEME="intheloop"
# ZSH_THEME="gnzh"
# ZSH_THEME="kphoen"
# ZSH_THEME="trapd00r"
# ZSH_THEME="dst"
# ZSH_THEME="linuxonly"
# ZSH_THEME="blinks"
ZSH_THEME="re5et"
# ZSH_THEME="alanpeabody"
# ZSH_THEME="random"

source $ZSH/oh-my-zsh.sh

# Zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/find-the-command/ftc.zsh

source $HOME/.local/share/zsh/plugins/gopass-completion.zsh
compdef _gopass gopass

eval "$(fasd --init auto)"

export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export ALTERNATE_EDITOR=nano
export EMACS_SERVER_FILE="/tmp/emacs$(id -u $LOGNAME)/server"
export LESS=-FRX

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs -Q --eval "(setq auto-save-default nil make-backup-files nil)"'
else
  export EDITOR="emacsclient --tty --socket-name $EMACS_SERVER_FILE"
fi

alias reload="echo Reloading .zshrc...; source ~/.zshrc"
alias woman=man

alias -g L="|less"
alias -g LE="2>&1|less"
alias -g G="|grep -i"
alias -g C="|xclip -sel clip"

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
[ -s "/usr/share/nvm/init-nvm.sh" ] && source /usr/share/nvm/init-nvm.sh # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# https://unix.stackexchange.com/questions/22834/how-to-uncompress-zlib-data-in-unix#49066
zlibd() (printf "\x1f\x8b\x08\x00\x00\x00\x00\x00" | cat - $@ | gzip -dc 2>/dev/null)

open() (xdg-open $@ &)

tmp() {
  pushd $(mktemp -d)
}
