function rmf --wraps=rm --description 'Remove files or directories forcefully and recursively'
    command rm --recursive --force --verbose $argv
end
