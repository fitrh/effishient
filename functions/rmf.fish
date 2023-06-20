function rmf --wraps=rm --description 'Remove files or directories forcefully and recursively'
    rm --recursive --force --verbose $argv
end
