function __pyenv_remove
    if test -z "$argv"
        printf "Please provide a name for virtual environment.\n"
        return 1
    end

    for pattern in "." --cwd
        if set i (contains -i -- "$pattern" $argv)
            set -e -- argv[$i]
            if not test -d $argv
                log e $argv "does not exist"
                return 1
            end
            if not rm -rfv $argv
                log e "Fail to remove" $argv
                return 1
            end
            log s $argv removed
            return
        end
    end

    set -l dir $HOME/.local/lib/pyenvs
    if not test -d $dir/$argv[1]
        log e $argv[1] "does not exist"
        return 1
    end

    if not rm -rfv $dir/$argv[1]
        log e "Fail to remove" $argv[1]
        return 1
    end
    log s $argv[1] removed
end
