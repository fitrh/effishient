function __g_pull
    set -l old_head (git rev-parse --short HEAD)
    if test -z "$argv"
        if not git pull --ff-only --progress --rebase=false
            return 1
        end
        __g_pull_log $old_head
        return 0
    end
    git pull --progress $argv
    __g_pull_log $old_head
end

function __g_pull_log
    set -l old_head $argv[1]
    set -l new_head (git rev-parse --short HEAD)
    if test $old_head = $new_head
        return 0
    end
    printf "\nRun "
    printf "\e[0;92mgit log %s..%s\e[0m " $old_head $new_head
    printf "to see the update log\n"
end
