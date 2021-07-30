function ls --wraps ls
    command ls --color --group-directories-first -hp $argv
end
