function log
    if test -z "$argv"
        return 0
    end

    switch $argv[1]
        case e error
            __log_error "[ERROR]" $argv[2..]
        case w warn
            __log_warn "[WARN]" $argv[2..]
        case i info
            __log_info "[INFO]" $argv[2..]
        case s success
            __log_success "[SUCCESS]" $argv[2..]
        case t trace
            __log_trace "[TRACE]" $argv[2..]
        case d debug
            __log_debug "[DEBUG]" $argv[2..]
    end
end
