if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init -)"
fi

if [ -d $HOME/perl5 ]; then
    source $HOME/perl5/perlbrew/etc/bashrc
fi

if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

if [ -d $HOME/.nodebrew ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

if [ -d $HOME/.cargo ]; then
    . "$HOME/.cargo/env"
fi
