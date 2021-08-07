function __setscheme_list_scheme
    for color in $XDG_CONFIG_HOME/fish/colors/*.fish
        set color (string trim -rc ".fish" (basename $color))
        printf "    \e[1m - \e[94m%s\e[0m\n" $color
    end
end

function setscheme
    set COLOR_D $XDG_CONFIG_HOME/fish/colors

    if test -z "$argv"
        printf "\n\e[1;91mPlease specify scheme\e[0m\n"
        printf "\e[1;92mAvailable scheme : \e[0m\n"
        __setscheme_list_scheme
        printf "\n"
        return 1
    end

    if not test -f $COLOR_D/$argv[1].fish
        printf "\n\e[1;91m%s scheme not available\e[0m\n" $argv[1]
        printf "\e[1;92mAvailable scheme : \e[0m\n"
        __setscheme_list_scheme
        printf "\n"
        return 1
    end

    fish $COLOR_D/$argv[1].fish
end
