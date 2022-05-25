function __pp_list
    set -l FORMATS columns freeze json
    set -l FORMAT freeze

    if test -n "$argv"
        if contains -- "$argv[1]" $FORMATS
            set FORMAT $argv[1]
        end
    end

    python -m pip list --format=$FORMAT
end
