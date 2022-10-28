function log
    if test -z "$argv"
        __log_help
        return 0
    end

    switch $argv[1]
        case e error
            __log_show 91 "[ERROR]" $argv[2..]
        case w warn
            __log_show 93 "[WARN]" $argv[2..]
        case i info
            __log_show 94 "[INFO]" $argv[2..]
        case s success
            __log_show 92 "[SUCCESS]" $argv[2..]
        case t trace
            __log_show 95 "[TRACE]" $argv[2..]
        case d debug
            __log_show 37 "[DEBUG]" $argv[2..]
        case test
            for level in error warn info success trace debug
                log $level "$level log message"
            end
        case "*"
            __log_help
    end
end
