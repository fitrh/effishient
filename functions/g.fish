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
        exa --icons --group-directories-first
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
        case c
            git clone $argv[2..-1]
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
        case f
            git fetch $argv[2..-1]
        case hash
            git rev-parse --short $argv[2..]
        case i init
            __g_init $argv[2..]
        case is
            git rev-parse --is-inside-work-tree $argv[2..]
        case l
            git log $argv[2..-1]
        case ll
            git log -p $argv[2..]
        case m
            git merge $argv[2..-1]
        case pl
            git pull --ff-only --progress $argv[2..]
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
        case st
            git status $argv[2..-1]
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
            if not onefetch
                return
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

function __g_init
    set DIR (basename (pwd))
    if not git init $argv
        printf "\n\e[1;31mFAILED\e[0m: Init \e[1m%s\e[0m as git repository\n" $DIR
        return 1
    end
    printf "\n\e[1;32mSUCCESS\e[0m: Init \e[1m%s\e[0m as git repository\n" $DIR

    if not touch .gitignore
        printf "\e[1;31mFAILED\e[0m: Create \e[1m.gitignore\e[0m\n"
        return 1
    end
    printf "\e[1;32mSUCCESS\e[0m: Create \e[1m.gitignore\e[0m\n\n"
    printf "Let's \e[1;32madd\e[0m, \e[1;34mcommit\e[0m, and \e[1mpush\e[0m\n\n"
end

function __g_update_dir
    set -l NORM "\e[0;0m"
    set -l GREEN "\e[0;32m"
    set -l RED "\e[0;31m"
    set -l BLUE "\e[0;34m"
    set -l BOLD "\e[1m"
    set -l cwd $PWD
    set -l git_dir $HOME/git
    set -l git_log $git_dir/(date -I)-git-status.log
    set -l up_to_date "Already up to date."

    if test (count $argv) -gt 0
        if contains this $argv
            set git_dir $PWD
            if ! contains no-log $argv
                set git_log $PWD/(date -I)-git.log
            end
        end
    end

    for dir in $git_dir/*/
        if test -d $dir
            cd $dir
            if test (git rev-parse --is-inside-work-tree)
                set -l dir (basename $dir)
                set -l is_up_to_date (git pull --ff-only)
                if test $status -ne 1
                    if test "$is_up_to_date[1]" != $up_to_date
                        printf "\n$GREEN$BOLD%s : Updated.$NORM\n\n" $dir
                        if not contains -- no-log $argv
                            printf "%s updated at %s\n" \
                                $dir (date +'%H:%M:%S%s%Z') >>$git_log
                        end
                    else
                        printf "$BLUE$BOLD%s : Already up to date.$NORM\n" $dir
                    end
                else
                    if not contains -- no-log $argv
                        printf "%s: Problematic git directory.\n" \
                            "$dir" >>$git_log
                    end
                    printf "$RED$BOLD%s : Problematic git directory.$NORM\n\n" \
                        $dir
                end
            end
            cd ..
        end
    end

    cd $cwd
    if ! contains no-log $argv
        printf "Log saved into %s\n" $git_log
    end
end

function __g_get_url
    set -l remote_name $argv[1]
    if test -z $remote_name
        set remote_name origin
    end
    git remote get-url $remote_name
end
