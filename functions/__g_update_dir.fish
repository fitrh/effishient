function __g_update_dir
    set -l NORM "\e[0;0m"
    set -l GREEN "\e[0;32m"
    set -l RED "\e[0;31m"
    set -l BLUE "\e[0;34m"
    set -l BOLD "\e[1m"
    set -l cwd $PWD
    set -l git_dir $HOME/git
    set -l git_log $git_dir/(date -I)-git-status.log

    if test -n "$argv"
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
                set -l rev (git rev-parse --short HEAD)

                if not git pull --ff-only --rebase=false --quiet
                    if not contains -- no-log $argv
                        printf "%s: Problematic git directory.\n" \
                            "$dir" >>$git_log
                    end
                    printf "$RED$BOLD%s : Problematic git directory." $dir
                    printf "$NORM\n"
                end

                set -l new_rev (git rev-parse --short HEAD)

                if test $rev != $new_rev
                    printf "$GREEN$BOLD%s : Updated.$NORM\n" $dir
                    if not contains -- no-log $argv
                        printf "%s updated at %s\n" \
                            $dir (date +'%H:%M:%S%s%Z') >>$git_log
                    end
                else
                    printf "$BLUE$BOLD%s : Already up to date.$NORM\n" $dir
                end
            end
            cd ..
        end
    end

    cd $cwd
    if not contains -- no-log $argv
        printf "Log saved into %s\n" $git_log
    end
end
