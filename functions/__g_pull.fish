function __g_pull
    if test -z "$argv"
        if not git pull --ff-only --progress --rebase=false $argv
            return 1
        end
        return 0
    end
    git pull --progress $argv
end
