function __dotfile_commit
    if test -z "$argv[1]"
        if not __dotfile_cmd commit -S
            return 1
        end
        return 0
    end
    __dotfile_cmd commit -S -m $argv
end
