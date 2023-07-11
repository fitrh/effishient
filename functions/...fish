function .. --description 'Go to the n-th parent dir' --argument-names depth
    set parent '..'
    if test -n "$depth"
        set parent (string repeat --count $depth '../')
    end
    cd $parent
end
