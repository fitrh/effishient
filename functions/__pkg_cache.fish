function __pkg_cache
    set -l CACHE_DIR /var/cache/pacman/pkg
    if test $PWD != $CACHE_DIR
        cd $CACHE_DIR
    end

    switch $argv[1]
        case du
            du -ah --max-depth 1 | sort -hr | less
        case ls
            if command -sq eza
                eza -l --no-permissions --no-user --sort oldest *.tar.zst | less
                return 0
            end
            if command -sq exa
                exa -l --no-permissions --no-user --sort oldest *.tar.zst | less
                return 0
            end
            ls -lh --no-group --sort time *.tar.zst | cut -c 19- | less
    end
end
