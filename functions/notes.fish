function notes -d "Personal Notes manager"
    set -l dir $HOME/documents/markdown
    if test -z "$argv"
        glow -w 120 $dir
        return 0
    end

    if set i (contains -i -- "-e" $argv)
        set -e -- argv[$i]
        $EDITOR $dir/$argv[$i].md
        return 0
    end

    if test -f $dir/$argv[1].md
        glow -w 120 $dir/$argv[1].md
        return 0
    end

    glow -w 120 $dir
end
