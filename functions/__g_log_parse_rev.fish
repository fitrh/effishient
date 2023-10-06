function __g_log_parse_rev
    if test -z "$argv"
        return
    end

    for i in (seq (count $argv))
        switch $argv[$i]
            case hh HH
                set argv[$i] "HEAD@{1}...HEAD"
            case hf HF
                set argv[$i] "HEAD...FETCH_HEAD"
        end
    end

    # separate with newline to allow consuming the output as a list
    printf "%s\n" $argv
end
