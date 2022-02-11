function __g_get_url
    set -l remote_name $argv[1]
    if test -z $remote_name
        set remote_name origin
    end
    git remote get-url $remote_name
end
