function __g_log_parse_rev
    set -l args $argv
    switch $argv[1]
        case hh HH
            set args "HEAD@{1}...HEAD"
        case hf HF
            set args "HEAD...FETCH_HEAD"
    end
    printf "%s" $args
end
