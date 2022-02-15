function __pkg_sanitize_args
    set TO_SANITIZE $argv[1]
    set ARGS $argv[2..]
    if set IDX (contains -i -- "$TO_SANITIZE" $ARGS)
        set -e -- ARGS[$IDX]
    end
    printf "%s" $ARGS
end
