function log
    if test -z "$argv"
        return 0
    end

    switch $argv[1]
        case e error
            __log_error $argv[2..]
        case w warn
            __log_warn $argv[2..]
        case i info
            __log_info $argv[2..]
        case s success
            __log_success $argv[2..]
    end
end
