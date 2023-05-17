function __mirr_help
    printf "\n  Usage: \e[1;32mmirr\e[0m <\e[1;33moption\e[0m> "
    printf "<\e[1;36margument\e[0m(\e[1;36ms\e[0m)>\n"
    printf "\n  Available Options \n"
    printf "    \e[1;33m-l --list\e[0m\t\t: List latest synchronized mirrors\n"
    printf "    \e[1;33m-g --generate\e[0m\t: Save latest syhchronized mirrors to "
    printf "\e[32m%s\e[0m\n" $MIRR_MIRRORS
    printf "    \e[1;33m-s --status\e[0m\t\t: View current mirros status from"
    printf " \e[32m%s\e[0m\n" $MIRR_MIRRORS
    printf "\n  Available Arguments \n"
    printf "    \e[1;36mcountry=\e[0;3;33mCOUNTRY\e[0m\t: "
    printf "Get mirrors located at \e[0;3;33mCOUNTRY\e[0m "
    printf "(default: \e[94m%s\e[0m)\n" $MIRR_COUNTRY
    printf "    \e[1;36minstance=\e[0;3;33mNUM\e[0m\t: "
    printf "Get top \e[0;3;33mNUM\e[0m of available mirrors "
    printf "(default: \e[94m%s\e[0m)\n\n" $MIRR_INSTANCE
end
