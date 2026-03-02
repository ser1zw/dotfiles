# -*- mode: sh-mode; coding: utf-8-unix -*-

########################################################################
### Option
########################################################################
export EDITOR=vi
export GIT_EDITOR=vi
bindkey -e
export LANG=ja_JP.UTF-8
export LESSCHARSET=UTF-8
setopt auto_cd
setopt auto_pushd
setopt nolistbeep
unsetopt promptcr
setopt no_beep
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
typeset -U path PATH

case "${OSTYPE}" in
darwin*)
  export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH" # GNU coreutils
  GNUTERM=x11
  export GNUTERM
  ;;
linux*)
  eval `dircolors -b` # set LS_COLORS automatically (GNU style)
  ;;
esac

# Has rlwrap command?
which rlwrap >/dev/null
has_rlwrap=$?

########################################################################
### Completion
########################################################################
if [ -d $HOME/perl5 ]; then
  source $HOME/perl5/perlbrew/etc/perlbrew-completion.bash
fi

if [ -d $HOME/.nodebrew ]; then
  fpath=($HOME/.nodebrew/completions/zsh ${fpath})
fi

if [ -s $HOME/.rbenv/completions/rbenv.zsh ]; then
  source $HOME/.rbenv/completions/rbenv.zsh
fi

autoload -U compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # ignore up/downcase
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


########################################################################
### history
########################################################################
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt hist_ignore_dups	# ignore duplication command history list
setopt share_history	# share command history data


########################################################################
### aliases
########################################################################
alias ls="ls --color=auto"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"


########################################################################
### Prompt / Status line
########################################################################
PROMPT="[%n@%M %c]$ "

# tmuxステータスラインのGitブランチ名をgitコマンド実行後・ディレクトリ変更時に更新
_tmux_git_update() {
  [[ -n $TMUX ]] || return
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
#  [[ -n $branch ]] || return
  tmux set-option -w @git_branch "[${branch}] "
  tmux refresh-client -S
}

_tmux_git_preexec() {
  [[ $1 == git* ]] && _tmux_ran_git=1
}

_tmux_git_precmd() {
  [[ -n $_tmux_ran_git ]] || return
  unset _tmux_ran_git
  _tmux_git_update
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec _tmux_git_preexec
add-zsh-hook precmd _tmux_git_precmd
add-zsh-hook chpwd _tmux_git_update


########################################################################
### Tool
########################################################################

### Oracle Database
INSTANT_CLIENT_HOME=$HOME/local/instantclient_19_8
PATH=$INSTANT_CLIENT_HOME:$PATH
case "${OSTYPE}" in
linux*)
  LD_LIBRARY_PATH=$INSTANT_CLIENT_HOME:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH
  ;;
darwin*)
  DYLD_FALLBACK_LIBRARY_PATH=$INSTANT_CLIENT_HOME:$DYLD_FALLBACK_LIBRARY_PATH
  export DYLD_FALLBACK_LIBRARY_PATH
  ;;
esac
NLS_LANG=JAPANESE_JAPAN.AL32UTF8
export PATH NLS_LANG
if [ $has_rlwrap -eq 0 ]; then
  alias sqlplus='rlwrap sqlplus'
fi

### OpenCV
OPENCV_HOME=$HOME/local/opencvlibrary
PKG_CONFIG_PATH=$OPENCV_HOME/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH
case "${OSTYPE}" in
linux*)
  LD_LIBRARY_PATH=$OPENCV_HOME/share/OpenCV/3rdparty/lib:$OPENCV_HOME/lib:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH
  ;;
darwin*)
  DYLD_FALLBACK_LIBRARY_PATH=$OPENCV_HOME/lib:$DYLD_FALLBACK_LIBRARY_PATH
  export DYLD_FALLBACK_LIBRARY_PATH
  ;;
esac
export PYTHONPATH=$OPENCV_HOME/lib/python2.7/dist-packages:$PYTHONPATH


### Python
export VIRTUALENV_DISTRIBUTE=true
export PIPENV_VENV_IN_PROJECT=true

### Common Lisp
PATH=$PATH:$HOME/.roswell/bin

### Go
export GOROOT=$HOME/local/go
PATH=$PATH:$GOROOT/bin:$HOME/go/bin



### Kubernetes
if which kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

export JAVA_HOME=$HOME/.jdks/temurin-25.0.2
PATH=$JAVA_HOME/bin:$PATH

LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

PATH=$HOME/local/bin:$HOME/.local/bin:$PATH
export PATH
