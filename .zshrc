# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh
export ZSH_CUSTOM=$HOME/.my-zsh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.stack/programs/x86_64-linux/ghc-tinfo6-nopie-7.10.3/bin:$HOME/.rbenv/shims:$PATH

export TERM=xterm
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)
export PAGER=less
export LESS=-FRX
export GREP=ag
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export ALTERNATE_EDITOR="uemacs"
export EMACS_SERVER_FILE="/tmp/emacs$(id -u $LOGNAME)/server"
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs -Q --eval "(setq auto-save-default nil make-backup-files nil)"'
else
  export EDITOR="emacsclient --tty -f $EMACS_SERVER_FILE"
fi
export VISUAL="emacsclient -c -f $EMACS_SERVER_FILE"

export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_VARIANT=altgr-intl
export XKB_DEFAULT_OPTIONS=ctrl:nocaps

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git tmux gpg-agent pass)

ZSH_THEME="anler"
ZSH_THEME="wezm+"
ZSH_THEME="avit"
# ZSH_THEME="refined"
# ZSH_THEME="garyblessington"
# ZSH_THEME="random"

source $ZSH/oh-my-zsh.sh

# Zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# depends on fasd being installed
eval "$(fasd --init auto)"

alias reload="echo Reloading .zshrc...; source ~/.zshrc"
alias woman=man

alias -g L="|$PAGER"
alias -g LE="2>&1|$PAGER"
alias -g G="|$GREP -i"
alias -g C="|xclip -sel clip"
alias -g X="chmod +x"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

eval "$(rbenv init -)"

# eval $(dircolors $HOME/.dir_colors/dircolors)

# https://unix.stackexchange.com/questions/22834/how-to-uncompress-zlib-data-in-unix#49066
zlibd() (printf "\x1f\x8b\x08\x00\x00\x00\x00\x00" | cat - $@ | gzip -dc 2>/dev/null)

open() (xdg-open $@ &)

tmp() {
  pushd $(mktemp -d)
}
