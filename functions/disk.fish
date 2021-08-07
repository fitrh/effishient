function __disk_usage
    printf "Usage:\n"
    printf "\t\e[1;32mdisk\e[0m \e[1;34m<options>\e[0m \e[1;33m<device>\e[0m\n"
    printf "\nAvailable Options :\n"
    printf "\t\e[34mm\e[0m, \e[34mmount\e[0m\t: "
    printf "mount a device into /run/media/$USER\n"
    printf "\t\e[34mum\e[0m, \e[34munmount\e[0m\t: "
    printf "unmount a device\n"
    printf "\nAvailable Device to mount :\n"
    lsblk -no NAME
end

function disk --wraps udisksctl

    if test -z "$argv"
        __disk_usage
        return 0
    end

    switch $argv[1]
        case m mount
            udisksctl mount -b $argv[2..]
        case um unmount
            udisksctl unmount -b $argv[2..]
        case "*"
            __disk_usage
    end

end
