set -g __COUNTRY Indonesia
set -g __INSTANCE 5
set -g __MIRRORS "/etc/pacman.d/mirrorlist"

function mirr
    if test -z "$argv"
        __mirr_help
        return
    end

    switch $argv[1]
        case -g --generate
            __mirr_generate $argv[2..-1]
        case -l --list
            __mirr_list $argv[2..-1]
        case -s --status
            echo "Current Mirror Status"
            tail -n +6 $__MIRRORS
        case -h --help
            __mirr_help
        case '*'
            echo "Invalid argument."
            __mirr_help
    end
end

function __mirr_help
    printf "\n  Usage : \e[1;32mmirr\e[0m <\e[1;33moption\e[0m> "
    printf "<\e[1;36margument\e[0m(\e[1;36ms\e[0m)>\n"
    printf "\n  Available Options \n"
    printf "    \e[1;33m-l --list\e[0m\t\t: List latest synchronized mirrors\n"
    printf "    \e[1;33m-g --generate\e[0m\t: Save latest syhchronized mirrors to "
    printf "\e[32m%s\e[0m\n" $__MIRRORS
    printf "    \e[1;33m-s --status\e[0m\t\t: View current mirros status from"
    printf " \e[32m%s\e[0m\n" $__MIRRORS
    printf "\n  Available Arguments \n"
    printf "    \e[1;36mcountry=\e[0;3;33mCOUNTRY\e[0m\t: "
    printf "Get mirrors located at \e[0;3;33mCOUNTRY\e[0m "
    printf "(default : \e[94m%s\e[0m)\n" $__COUNTRY
    printf "    \e[1;36minstance=\e[0;3;33mNUM\e[0m\t: "
    printf "Get top \e[0;3;33mNUM\e[0m of available mirrors "
    printf "(default : \e[94m%s\e[0m)\n\n" $__INSTANCE
end

function __mirr_parse_args
    for arg in $argv
        set -l key (printf $arg | cut -d '=' -f 1)
        set -l value (printf $arg | cut -d '=' -f 2)
        switch $key
            case country
                set __COUNTRY $value
            case instance
                set __INSTANCE $value
        end
    end
end

function __mirr_generate
    if test -z "$argv"
        sudo reflector -l $__INSTANCE -f $__INSTANCE \
            --protocol https,http \
            --sort rate --verbose --save $__MIRRORS
        return
    end

    __mirr_parse_args $argv
    sudo reflector -c $__COUNTRY -l $__INSTANCE -f $__INSTANCE \
        --protocol http,https \
        --sort rate --verbose --save $__MIRRORS
end

function __mirr_list
    if test -z "$argv"
        reflector -l $__INSTANCE -f $__INSTANCE \
            --protocol http,https \
            --sort rate --verbose
        return
    end

    __mirr_parse_args $argv

    reflector -c $__COUNTRY -l $__INSTANCE -f $__INSTANCE \
        --sort rate --verbose \
        --protocol http,https
end
