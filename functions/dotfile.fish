function dotfile --wraps git
    switch $argv[1]
        case a
            __dotfile_cmd add $argv[2..]
        case d
            __dotfile_cmd diff $argv[2..]
        case dc
            __dotfile_cmd diff --cached $argv[2..]
        case s
            __dotfile_cmd status $argv[2..]
        case cm
            __dotfile_commit $argv[2..]
        case patch
            __dotfile_cmd add --patch $argv[2..]
        case ps
            __dotfile_cmd push $argv[2..]
        case '*'
            __dotfile_cmd $argv
    end
end

function __dotfile_cmd
    set DOTFILES $HOME/git/dotfiles
    set GIT (which git)
    set CMD $GIT --git-dir=$DOTFILES --work-tree=$HOME
    $CMD $argv
end

function __dotfile_commit
    if test -z "$argv[1]"
        if not __dotfile_cmd commit -S
            return 1
        end
        return 0
    end
    __dotfile_cmd commit -S -m $argv
end
