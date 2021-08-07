set -g __SCREENS (xrandr | rg -w connected | cut -f 1 -d ' ')
set -g __NON_PRIMARY $__SCREENS
set -g __STATES Same Left Right Above Below Off "Primary Only"

function __scrctl_help
    printf "\nUsage : \e[1;32mscrctl\e[0m \e[1;36margument\e[0m\n\n"
    printf "Available Argument :\n\n"
    printf "    \e[1;36marrange\e[0m\t\t: Arrange screen position\n"
    printf "    \e[1;36mlist\e[0m\t\t: List all connected screen\n"
    printf "    \e[1;36mprimary\e[0m\t\t: Set the primary screen\n"
    printf "    \e[1;36moff\e[0m\t\t\t: Turn off a screen\n"
    printf "\n"
end

function __scrctl_list
    printf "\e[1;32mCONNECTED SCREENS\e[0m\n"
    for i in (seq (count $__SCREENS))
        printf "\e[1;92m %d)\e[0m\e[1;94m %s \e[0m\n" $i $__SCREENS[$i]
    end
end


function __scrctl_set_direction -a screen direction_name direction
    set -l OTHERS $__SCREENS
    set -l SELECTED -1

    if set IDX (contains -i -- "$screen" $OTHERS)
        set -e -- OTHERS[$IDX]
    end

    printf "  \e[1;32m%s\e[0m %s :\n" $screen $direction_name
    for i in (seq (count $OTHERS))
        printf "   \e[1;32m%d)\e[0m \e[1;94m%s\e[0m\n" $i $OTHERS[$i]
    end

    while test $SELECTED -lt 1 -o $SELECTED -gt (count $OTHERS)
        read -n 1 -P '   ENTER SCREEN INDEX : ' SELECTED
    end

    xrandr --output $screen $direction $OTHERS[$SELECTED] --auto
    setbg
    printf "   \e[1;32m%s\e[0m " $screen
    printf "%s \e[1;31m%s\e[0m\n\n" $direction_name $OTHERS[$SELECTED]
end

function __scrctl_off -a screens
    if test -z "$screens"
        set -l SELECTED -1
        __scrctl_list

        while test $SELECTED -lt 1 -o $SELECTED -gt (count $__SCREENS)
            read -n 1 -P ' ENTER SCREEN INDEX : ' -l SELECTED
        end

        set screens $__SCREENS[$SELECTED]
    end

    set -l PRIMARY (xrandr | rg " connected primary " | cut -f 1 -d ' ')
    if set IDX (contains -i -- "$PRIMARY" $screens)
        set -e screens[$IDX]
    end

    for screen in $screens
        xrandr --output $screen --off
    end

    printf "  \e[1;31m%s\e[0m turned off\n\n" $screens
end

function __scrctl_arrange
    set -l SELECTED -1
    printf "\e[1;31mARRANGE SCREEN\e[0m\n"
    __scrctl_list
    while test \( $SELECTED -lt 1 \) -o \( $SELECTED -gt (count $__SCREENS) \)
        read -n 1 -P ' ENTER SCREEN INDEX : ' SELECTED
    end

    set -l screen $__SCREENS[$SELECTED]
    set -l INDEX -1

    printf " State of \e[1;32m%s\e[0m\n" $screen
    for i in (seq (count $__STATES))
        printf "  \e[1;32m%d)\e[0m \e[1;94m%s\e[0m\n" $i $__STATES[$i]
    end

    while test $INDEX -lt 1 -o $INDEX -gt (count $__STATES)
        read -n 1 -P '  ENTER STATE INDEX : ' INDEX
    end

    switch $__STATES[$INDEX]
        case "Primary Only"
            __scrctl_off $NON_PRIMARY
            return
        case Off
            __scrctl_off $screen
        case Left
            __scrctl_set_direction $screen "Left Of" --left-of
        case Right
            __scrctl_set_direction $screen "Right Of" --right-of
        case Above
            __scrctl_set_direction $screen "Above Of" --above
        case Below
            __scrctl_set_direction $screen "Below Of" --below
        case Same
            __scrctl_set_direction $screen "Same as" --same-as
    end
end

function __scrctl_primary
    set -l SELECTED -1
    printf "\e[1;31mSET PRIMARY SCREEN\e[0m\n"
    __scrctl_list

    while test $SELECTED -lt 1 -o $SELECTED -gt (count $__SCREENS)
        read -n 1 -P ' ENTER SCREEN INDEX : ' SELECTED
    end

    xrandr --output $__SCREENS[$SELECTED] --primary --auto
    printf " set \e[1;34m%s\e[0m" $__SCREENS[$SELECTED]
    printf " as \e[1;31mPRIMARY\e[0m screen\n\n"

    set -e __NON_PRIMARY[$SELECTED]

    printf "\e[1mSTATE OF OTHER SCREENS\n"
    for screen in $__NON_PRIMARY
        set -l INDEX -1
        printf "State of \e[1;32m%s\e[0m\n" $screen
        for i in (seq (count $__STATES))
            printf " \e[1;32m%d)\e[0m \e[1;94m%s\e[0m\n" $i $__STATES[$i]
        end

        while test $INDEX -lt 1 -o $INDEX -gt (count $__STATES)
            read -n 1 -P ' ENTER STATE INDEX : ' INDEX
        end

        switch $__STATES[$INDEX]
            case "Primary Only"
                __scrctl_off $__NON_PRIMARY
                return
            case Off
                __scrctl_off $screen
            case Left
                __scrctl_set_direction $screen "Left Of" --left-of
            case Right
                __scrctl_set_direction $screen "Right Of" --right-of
            case Above
                __scrctl_set_direction $screen "Above Of" --above
            case Below
                __scrctl_set_direction $screen "Below Of" --below
            case Same
                __scrctl_set_direction $screen "Same as" --same-as
        end
    end
end

function scrctl
    if test -z "$argv"
        __scrctl_primary
        return
    end

    switch $argv[1]
        case arrange
            __scrctl_arrange
        case list ls
            __scrctl_list
        case off
            __scrctl_off
        case primary
            __scrctl_primary
        case help "*"
            __scrctl_help
    end
end
