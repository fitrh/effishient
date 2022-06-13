function g --wraps git
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
            git add $argv[2..-1]
        case br
            git branch $argv[2..-1]
        case bra
            git branch --all $argv[2..-1]
        case brc
            git branch $argv[2..-1]
            git checkout $argv[2..-1]
        case brd
            git branch --delete $argv[2..-1]
        case brv
            git branch -vv $argv[2..]
        case c
            git clone $argv[2..-1]
        case cd
            git clone --depth $argv[2..]
        case ch
            git checkout $argv[2..-1]
        case cm
            if test -z "$argv[2]"
                git commit -S
            else
                git commit -S -m $argv[2..-1]
            end
        case cma
            git commit --amend $argv[2..]
        case conf
            git config $argv[2..]
        case d
            git diff $argv[2..-1]
        case dc
            git diff --cached $argv[2..]
        case f
            git fetch $argv[2..-1]
        case hash
            git rev-parse --short $argv[2..]
        case i init
            __g_init $argv[2..]
        case is
            git rev-parse --is-inside-work-tree $argv[2..]
        case l
            git log --stat $argv[2..-1]
        case ll
            git log --stat -p $argv[2..]
        case lo
            git log --oneline $argv[2..]
        case lop
            git log \
                --pretty="format:%C(bold yellow)%h %Creset%C(dim magenta)(%cd)%Creset %C(brightwhite)%<(70,trunc)%s%Creset %C(brightblack)ﰖ %C(blue)%<(15,trunc)%aN %C(brightblack)%<(15,trunc)%cr %C(bold red)%>(15,trunc)%D" \
                --date="format:%Y-%m-%d %H:%M" \
                $argv[2..]
        case ls
            git log -S $argv[2..]
        case m
            git merge $argv[2..-1]
        case patch
            git add --patch $argv[2..]
        case pl
            __g_pull $argv[2..]
        case pls
            git pull --rebase --depth 1 $argv[2..]
        case ps
            git push $argv[2..-1]
        case psf
            git push --force-with-lease $argv[2..]
        case ra
            git remote add $argv[2..]
        case rb
            git rebase $argv[2..-1]
        case rbi
            git rebase -i $argv[2..-1]
        case re
            git restore $argv[2..-1]
        case res
            git reset --soft $argv[2..]
        case red
            git reset --hard $argv[2..]
        case rr
            git remote rename $argv[2..-1]
        case rm
            git rm $argv[2..-1]
        case rmc
            git rm --cached $argv[2..]
        case rmd
            git rm -r $argv[2..]
        case rs
            git remote set-url $argv[2..]
        case rv
            git remote -v $argv[2..-1]
        case ss
            git status --short $argv[2..]
        case st
            git status $argv[2..-1]
        case stu
            git status --untracked-files=no $argv[2..]
        case stacl
            git stash clear $argv[2..-1]
        case stad
            gits stash drop $argv[2..]
        case stap
            git stash apply $argv[2..-1]
        case stapop
            gits stash pop $argv[2..]
        case stas
            git stash $argv[2..-1]
        case stasl
            git stash list $argv[2..-1]
        case stashow
            git stash show $argv[2..-1]
        case stasv
            git statsh save $argv[2..-1]
        case sub
            git submodule $argv[2..]
        case sum
            if command -sq onefetch
                onefetch
            end
        case up
            __g_update_dir $argv[2..-1]
        case url
            __g_get_url $argv[2..]
        case sw
            git switch $argv[2..-1]
        case '*'
            git $argv
    end
end
