function __g_update_dir
    if test $PWD = $HOME
        log i "use dotfile command"
        return 0
    end

    set -l NORM "\e[0;0m"
    set -l GREEN "\e[0;32m"
    set -l RED "\e[0;31m"
    set -l BLUE "\e[0;34m"
    set -l BOLD "\e[1m"
    set -l cwd $PWD
    set -l git_dir $HOME/git
    set -l git_log $git_dir/(date -I)-git-status.log

    if test -n "$argv"
        if test (contains "." $argv) -o (contains this $argv)
            set git_dir $PWD
            if ! __nolog $argv
                set git_log $PWD/(date -I)-git.log
            end
        end
    end

    for dir in $git_dir/*/
        if test -d $dir
            cd $dir
            if test (git rev-parse --is-inside-work-tree)
                set -l dir (basename $dir)
                set -l rev (git rev-parse --short HEAD)

                if not git pull --ff-only --rebase=false --quiet
                    if ! __nolog $argv
                        printf "%s: Problematic git directory\n" \
                            "$dir" >>$git_log
                    end
                    printf "$RED$BOLD%s: Problematic git directory" $dir
                    printf "$NORM\n"
                end

                set -l new_rev (git rev-parse --short HEAD)

                if test $rev != $new_rev
                    printf "$GREEN$BOLD%s: Updated$NORM (%s...%s)\n" $dir $rev $new_rev
                    if ! __nolog $argv
                        printf "%s...%s: %s updated at %s\n" \
                            $rev $new_rev $dir (date +'%H:%M:%S%s%Z') >>$git_log
                    end
                else
                    printf "$BLUE$BOLD%s: Already up to date$NORM\n" $dir
                end
            end
            cd ..
        end
    end

    cd $cwd
    if ! __nolog $argv
        if test -e $git_log
            printf "Log saved into \e[1;96m%s\e[0m\n" $git_log
        end
    end
end

function __nolog
    return (contains -- nolog $argv; or contains -- no-log $argv)
end
