function yt
    if test -z "$argv"
        return 1
    end

    if not pyenv --use util
        if not pyenv --create util
            return 1
        end
        if not pyenv --use util
            return 1
        end
        if not pp pip
            return 1
        end
        if not pp i youtube-dl
            return 1
        end
    end

    switch $argv[1]
        case dl
            __yt_download $argv[2..]
        case pl
            __yt_generate_url_from_playlist $argv[2..]
        case ql
            youtube-dl -F $argv[2..]
        case '*'
    end

    deactivate
end
