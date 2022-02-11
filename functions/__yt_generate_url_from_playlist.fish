function __yt_generate_url_from_playlist
    if test -z "$argv"
        log e yt ": No URL provided"
        return 1
    end

    set -l file_name (date +"%Y_%m_%d")
    if test -n "$argv[2]"
        set -l file_name $argv[2]
    end

    youtube-dl \
        -j \
        --flat-playlist $argv[1] |
        jq -r '.id' |
        sed 's_^_https://youtu.be/_' >>$file_name".log"
end
