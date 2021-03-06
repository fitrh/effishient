function dotfile --wraps git
    set DOTFILES $HOME/git/dotfiles
    set GIT (which git)
    set CMD $GIT --git-dir=$DOTFILES --work-tree=$HOME
    $CMD $argv
end
