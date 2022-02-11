function notes -d "Personal Notes manager"
    set -l cwd $PWD
    set -l dir $HOME/documents/markdown
    cd $dir
    if test -z "$argv"
        glow -w 120 .
        cd $cwd
        return 0
    end

    if set i (contains -i -- "e" $argv)
        set -e -- argv[$i]
        $EDITOR $argv[$i].md
        cd $cwd
        return 0
    end

    if test -f $argv[1].md
        glow -w 120 $argv[1].md
        cd $cwd
        return 0
    end

    glow -w 120 .
    cd $cwd
end
