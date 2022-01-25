function conf
    set -l _CWD (pwd)

    if test -z "$argv"
        cd $XDG_CONFIG_HOME; or cd $HOME/.config
        clear
        exa --only-dirs --icons
        set --erase _CWD
        return
    end

    set -l dir $HOME/.config
    set -l edit
    for e in $EDITOR vim vi
        if command -q $e
            set edit $e
            break
        end
    end

    if test -z $edit
        log e "No available editor"
        return 1
    end

    set -l open_editor $editor -c ":Telescope find_files"
    set -l config

    for arg in $argv
        set arg $dir/$arg
        if test -e $arg
            set config $arg
            if test -d $arg
                set dir $arg
                cd $dir
            end
        else
            printf 'No config available for %s\n' $arg
            cd $_CWD
            set --erase _CWD
            return 1
        end
    end

    if test -z $config
        cd $_CWD
        return 1
    end

    if test -d $config
        $open_editor
    else if test -f $config
        $edit $config
    end

    cd $_CWD
    set --erase _CWD
end
