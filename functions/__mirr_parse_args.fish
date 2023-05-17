function __mirr_parse_args
    for arg in $argv
        set -l key (printf $arg | cut -d '=' -f 1)
        set -l value (printf $arg | cut -d '=' -f 2)
        switch $key
            case country
                set -g MIRR_COUNTRY $value
            case instance
                set -g MIRR_INSTANCE $value
        end
    end
end
