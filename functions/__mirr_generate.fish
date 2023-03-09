function __mirr_generate
    if test -z "$argv"
        sudo reflector -l $__INSTANCE -f $__INSTANCE \
            --protocol https,http \
            --sort rate --verbose --save $__MIRRORS
        return
    end

    __mirr_parse_args $argv
    sudo reflector -c $__COUNTRY -l $__INSTANCE -f $__INSTANCE \
        --protocol http,https \
        --sort rate --verbose --save $__MIRRORS
end
