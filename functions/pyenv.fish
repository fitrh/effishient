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
        case -l --list
            __pyenv_list
        case -h --help '*'
            __pyenv_help
    end
end

function __pyenv_create_success
    printf "\e[1;92m%s\e[0m " $argv[1]
    printf "successfully created as virtual environment.\n"
    printf "Run \e[1;92mpyenv --use %s%s\e[0m to use it.\n" $argv[2] $argv[1]
end

function __pyenv_create
    if test -z "$argv"
        printf "Please provide a name for virtual environment.\n"
        return
    else if set i (contains -i -- "cwd" $argv)
        set -e -- argv[$i]
        if test -d $argv
            printf "\e[1;92m%s\e[0m is already exists.\n" $argv
            return
        end
        if python -m venv $argv
            __pyenv_create_success $argv 'cwd '
        end
        return
    end

    set -l dir $HOME/.local/lib/pyenvs
    if test -d $dir/$argv[1]
        printf "\e[1;92m%s\e[0m is already exists.\n" $argv[1]
        return
    end
    if python -m venv $dir/$argv[1]
        __pyenv_create_success $argv[1]
    end
end

function __pyenv_list
    set -l dir $HOME/.local/lib/pyenvs
    exa --only-dirs --oneline --icons $dir
end

function __pyenv_use_verify
    if test -d $argv
        if test -d $argv/bin
            if test -f $argv/bin/activate.fish
                . $argv/bin/activate.fish
            end
        end
    else
        printf "\e[1;31m%s\e[0m not a valid virtual environment.\n" $argv
    end
end

function __pyenv_use
    if test -z "$argv"
        printf "Please specify the name of virtual environment.\n"
        printf "Try \e[1;32mpyenv\e[0m \e[1;96m--list\e[0m "
        printf "to see available virtual environment.\n"
    else if set i (contains -i -- "cwd" $argv)
        set -e -- argv[$i]
        __pyenv_use_verify $argv
    else
        set -l env $HOME/.local/lib/pyenvs/$argv
        __pyenv_use_verify $env
    end
end

function __pyenv_help
    printf "Usage : \e[1;32mpyenv\e[0m "
    printf "\e[1;96m<arguments>\e[0m "
    printf "\e[1;33m<environment directory>\e[0m\n"
    printf "Available arguments: \n"
    printf "    -c, --create\t: Create virtual environment.\n"
    printf "    -l, --list\t\t: List available virtual environment.\n"
    printf "    -u, --use\t\t: Use a virtual environment.\n"
    printf "\t\t\t\t\t  See --list for available virtual environment.\n"
    printf "    -h, --help\t\t: Show this help.\n"
    printf "\n    available argument for "
    printf "\e[1;96m--create\e[0m & \e[1;96m--use\e[0m\n"
    printf "          cwd\t\t: Create / Use virtual environment"
    printf " in current directory.\n"
end
