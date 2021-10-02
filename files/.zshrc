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
#setopt correct
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

# zmvコマンドを使う (http://mollifier.hatenablog.com/entry/20101227/p1)
autoload -Uz zmv
alias zmv='noglob zmv -W'


########################################################################
### Prompt
########################################################################
PROMPT="[%n@%M %c]$ "

# get a prompt which indicates Git-branch (http://d.hatena.ne.jp/tototoshi/20110303/1299160478)
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'


########################################################################
### Tool
########################################################################
PATH=$HOME/local/bin:$PATH

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


### Java
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

### Clojure
export PATH=$HOME/local/clojure/bin:$PATH


### Common Lisp
alias clisp='clisp -q'


### Go
export GOROOT=$HOME/local/go
export PATH=$PATH:$GOROOT/bin


### tmux
# tmuxでキャプションをカレントディレクトリ名or実行中のコマンド名にする
# http://d.hatena.ne.jp/sugyan/20100121/1264000100
case "${TERM}" in
    screen)
	preexec() {
	    echo -ne "\ek$1\e\\"
	}
	precmd() {
            echo -ne "\ek$(basename $(pwd))\e\\"
	}
esac

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
