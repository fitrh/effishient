function conf
    set -l _CWD (pwd)
    set config_dir $XDG_CONFIG_HOME
    if test -z "$config_dir"
        set config_dir $HOME/.config
    end

    if test -z "$argv"
        cd $config_dir
        clear
        if command -q eza
            eza --only-dirs --icons
        else if command -q exa
            exa --only-dirs --icons
        else
            command ls --color --group-directories-first -hp
        end
        set --erase _CWD
        return
    end

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

    set -l open_editor $edit -c ":Telescope find_files"
    set -l config

    set -l dir $config_dir
    for arg in $argv
        set arg $dir/$arg
        if test -e $arg
            set config $arg
            if test -d $arg
                set dir $arg
                cd $dir
            end
        else
            printf 'No config available for \e[91m%s\e[0m\n' $arg
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
