function g --wraps git
    function CMD
        if test $PWD = $HOME
            dotfile $argv
        else
            command git $argv
        end
    end

    if test -z "$argv"
        cd ~/git && clear
        printf "\e[1;40;96m"
        printf "        _ _                       _ _           _   _                  \n"
        printf "   __ _(_) |_            ___ ___ | | | ___  ___| |_(_) ___  _ __  ___  \n"
        printf "  / _` | | __|  _____   / __/ _ \| | |/ _ \/ __| __| |/ _ \| '_ \/ __| \n"
        printf " | (_| | | |   |_____| | (_| (_) | | |  __/ (__| |_| | (_) | | | \__ \\ \n"
        printf "  \__, |_|\__|          \___\___/|_|_|\___|\___|\__|_|\___/|_| |_|___/ \n"
        printf "  |___/                                                                \n"
        printf "                                                                       \n\n\e[0m"
        if command -q exa
            exa --icons --group-directories-first
        else
            command ls --color --group-directories-first -hp
        end
        printf "\n"
        return
    end

    switch $argv[1]
        case a add
            CMD add $argv[2..]
        case br
            CMD branch $argv[2..]
        case bra
            CMD branch --all $argv[2..]
        case brc
            CMD branch $argv[2..]
            CMD checkout $argv[2..]
        case brd
            CMD branch --delete $argv[2..]
        case brv
            CMD branch -vv $argv[2..]
        case c
            CMD clone $argv[2..]
        case cd
            CMD clone --depth $argv[2..]
        case cf
            CMD clone --filter=blob:none $argv[2..]
        case ch
            CMD checkout $argv[2..]
        case cm
            if test -z "$argv[2]"
                CMD commit -S --verbose
            else
                CMD commit -S -m $argv[2..]
            end
        case cma
            CMD commit --amend $argv[2..]
        case conf
            CMD config $argv[2..]
        case d
            CMD diff $argv[2..]
        case dc
            CMD diff --cached $argv[2..]
        case f
            CMD fetch $argv[2..]
        case hash
            CMD rev-parse --short $argv[2..]
        case i init
            __g_init $argv[2..]
        case is
            CMD rev-parse --is-inside-work-tree $argv[2..]
        case l
            CMD log --stat (__g_log_parse_rev $argv[2..])
        case ll
            CMD log --stat -p (__g_log_parse_rev $argv[2..])
        case lo
            CMD log --oneline (__g_log_parse_rev $argv[2..])
        case lop
            CMD log \
                --pretty="format:%C(yellow)%h%Creset %C(brightwhite)%<(72,trunc)%s%Creset %C(brightblack)ﰖ %C(blue)%<(15,trunc)%aN %C(brightblack)%<(14,trunc)%cr %C(dim magenta)%cd%Creset %C(bold red)%<(15,trunc)%D" \
                --date="format:%Y/%m/%d %H:%M" \
                (__g_log_parse_rev $argv[2..])
        case ls
            CMD log -S $argv[2..]
        case m
            CMD merge $argv[2..]
        case patch
            CMD add --patch $argv[2..]
        case pl
            __g_pull $argv[2..]
        case pls
            if test -z "$argv[2]"
                CMD pull --rebase --depth 1
                return
            end
            CMD pull --rebase --depth $argv[2..]
        case ps
            CMD push $argv[2..]
        case psf
            CMD push --force-with-lease $argv[2..]
        case psu
            CMD push --set-upstream $argv[2..]
        case ra
            CMD remote add $argv[2..]
        case rb
            CMD rebase $argv[2..]
        case rbi
            CMD rebase -i $argv[2..]
        case re
            CMD restore $argv[2..]
        case res
            CMD reset --soft $argv[2..]
        case restage
            CMD restore --staged $argv[2..]
        case red
            CMD reset --hard $argv[2..]
        case rr
            CMD remote rename $argv[2..]
        case rm
            CMD rm $argv[2..]
        case rmc
            CMD rm --cached $argv[2..]
        case rmd
            CMD rm -r $argv[2..]
        case rs
            CMD remote set-url $argv[2..]
        case rv
            CMD remote -v $argv[2..]
        case ss
            CMD status --short $argv[2..]
        case ssu
            CMD status --short -uno $argv[2..]
        case st
            CMD status $argv[2..]
        case stu
            CMD status --untracked-files=no $argv[2..]
        case stacl
            CMD stash clear $argv[2..]
        case stad
            CMD stash drop $argv[2..]
        case stap
            CMD stash apply $argv[2..]
        case stapop
            CMD stash pop $argv[2..]
        case stas
            CMD stash $argv[2..]
        case stasl
            CMD stash list $argv[2..]
        case stashow
            CMD stash show $argv[2..]
        case sub
            CMD submodule $argv[2..]
        case sum
            if command -sq onefetch
                onefetch
            end
        case up
            __g_update_dir $argv[2..]
        case url
            __g_get_url $argv[2..]
        case sw
            CMD switch $argv[2..]
        case '*'
            CMD $argv
    end
end
