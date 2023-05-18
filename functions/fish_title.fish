function fish_title
    set dir (string shorten -m 30 -l (prompt_pwd -d 1 -D 3))
    if test "$dir" != "~"
        printf "%s · " $dir
    end

    printf "%s" $TERM

    set -l cmd (status current-command)
    if test "$cmd" != '' -a "$cmd" != fish
        printf ": %s" $cmd
    end
end
