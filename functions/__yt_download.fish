function __yt_download
    if test -z "$argv"
        log e yt ": No URL provided"
        return 1
    end
    for link in $argv
        youtube-dl \
            -f 22 \
            --external-downloader aria2c \
            --external-downloader-args "-s 8 -x 8" \
            $link
    end
end
