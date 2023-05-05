function __mirr_list
    if test -z "$argv"
        reflector --download-timeout $MIRR_TIMEOUT \
            -l $__INSTANCE -f $__INSTANCE \
            --protocol http,https \
            --sort rate --verbose
        return
    end

    __mirr_parse_args $argv
    reflector --download-timeout $MIRR_TIMEOUT \
        -c $__COUNTRY -l $__INSTANCE -f $__INSTANCE \
        --sort rate --verbose \
        --protocol http,https
end
