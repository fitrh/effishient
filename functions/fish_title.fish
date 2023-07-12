function fish_title
    set dir (string shorten -m 30 -l (prompt_pwd -d 1 -D 3))
    if test "$dir" != "~"
        if test (string sub -s 1 -e 2 $dir) = '~/'
            set dir (string sub -s 3 $dir)
        end

        printf "%s · " $dir
    end

    printf "%s" $TERM

    set -l cmd (status current-command)
    if test "$cmd" != '' -a "$cmd" != fish
        printf ": %s" $cmd
    end
end
