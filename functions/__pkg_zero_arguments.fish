function __pkg_zero_arguments
    printf "Available operation :\n\n"
    printf "    i, install\t: sudo pacman -Su\n"
    printf "    u, update\t: sudo pacman -Syu\n"
    printf "    s, search\t: pacman -Ss\n"
    printf "    sy, sync\t: pacman -Syy\n"
    printf "    info\t: pacman -Sii\n"
    printf "    c, clean\t: clean cache packages at /var/cache/pacman/pkg\n"
    printf "\t\t  but keep the latest version of installed package.\n"
    printf "    r, remove\t: sudo pacman -Rnssucv\n"
    printf "    q, query\t: pacman -Qs, if no package(s) or argument(s) given\n"
    printf "    h, help\t: Show this help\n\n"
    printf "Available option :\n\n"
    printf "    --aur\t: target for AUR\n"
    printf "    --agr\t: for \e[1;36mclean\e[0m opearation,\n"
    printf "\t\t  clean all cache with pacman -Scc.\n\n"
end
