function pyenv
    if test -z "$argv"
        __pyenv_help
        return
    end

    switch $argv[1]
        case -c --create
            __pyenv_create $argv[2..]
        case -u --use
            __pyenv_use $argv[2..]
        case -r --remove
            __pyenv_remove $argv[2..]
        case -l --list
            __pyenv_list
        case -h --help '*'
            __pyenv_help
    end
end
