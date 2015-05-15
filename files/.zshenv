if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init -)"
fi

if [ -d $HOME/perl5 ]; then
    source $HOME/perl5/perlbrew/etc/bashrc
fi

