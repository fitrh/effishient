complete -c sk -f

# Options
complete -c sk -s h -l help -d 'print this help menu'
complete -c sk -l version -d 'print out the current version of skim'

# Search
complete -c sk -l tac -d 'Reverse the order of the search result(normally used together with --no-sort)'
complete -c sk -l no-sort -d 'Do not sort the result'
complete -c sk -s t -l tiebreak -d 'Comma-separated list of sort criteria to apply when the scores are tied. Each criterion could be negated, e.g. (-index) and should appear only once in the list' -x -a "
    score\t'Score of the fuzzy match algorithm'
    index\t'Prefers line that appeared earlier in the input stream'
    begin\t'Prefers line with matched substring closer to the beginning'
    end\t'Prefers line with matched substring closer to the end'
    length\t
"
complete -c sk -s n -l nth -d 'specify the fields to be matched' -x -a "
    1\t
    2\t
    3\t
    4\t
    5\t
"
complete -c sk -l with-nth -d 'specify the fields to be transformed' -x -a "
    1\t
    2\t
    3\t
    4\t
    5\t
"
complete -c sk -s d -l delimiter -d 'specify the delimiter(in REGEX) for fields'
complete -c sk -s e -l exact -d 'start skim in exact mode'
complete -c sk -l regex -d 'use regex instead of fuzzy match'
complete -c sk -l algo -d 'Fuzzy matching algorithm (default: skim_v2)' -x -a "
    skim_v1\t'The legacy algorithm'
    skim_v2\t'Almost always the one to choose'
    clangd\t'the one used by clangd for keyword completion'
"
    #                      [skim_v1|skim_v2|clangd] (default: skim_v2)
    # --case [respect,ignore,smart] (default: smart)
    #                      case sensitive or not

  # Interface
    # -b, --bind KEYBINDS  comma seperated keybindings, in KEY:ACTION
    #                      such as 'ctrl-j:accept,ctrl-k:kill-line'
    # -m, --multi          Enable Multiple Selection
    # --no-multi           Disable Multiple Selection
    # --no-mouse           Disable mouse events
    # -c, --cmd ag         command to invoke dynamically
    # -i, --interactive    Start skim in interactive(command) mode
    # --color [BASE][,COLOR:ANSI]
    #                      change color theme
    # --no-hscroll         Disable horizontal scroll
    # --keep-right         Keep the right end of the line visible on overflow
    # --skip-to-pattern    Line starts with the start of matched pattern
    # --no-clear-if-empty  Do not clear previous items if command returns empty result
    # --show-cmd-error     Send command error message if command fails

  # Layout
    # --layout=LAYOUT      Choose layout: [default|reverse|reverse-list]
    # --height=HEIGHT      Height of skim's window (--height 40%)
    # --no-height          Disable height feature
    # --min-height=HEIGHT  Minimum height when --height is given by percent
    #                      (default: 10)
    # --margin=MARGIN      Screen Margin (TRBL / TB,RL / T,RL,B / T,R,B,L)
    #                      e.g. (sk --margin 1,10%)
    # -p, --prompt '> '    prompt string for query mode
    # --cmd-prompt '> '    prompt string for command mode

  # Display
    # --ansi               parse ANSI color codes for input strings
    # --tabstop=SPACES     Number of spaces for a tab character (default: 8)
    # --inline-info        Display info next to query
    # --header=STR         Display STR next to info
    # --header-lines=N     The first N lines of the input are treated as header

  # History
    # --history=FILE       History file
    # --history-size=N     Maximum number of query history entries (default: 1000)
    # --cmd-history=FILE   command History file
    # --cmd-history-size=N Maximum number of command history entries (default: 1000)

  # Preview
    # --preview=COMMAND    command to preview current highlighted line ({})
    #                      We can specify the fields. e.g. ({1}, {..3}, {0..})
    # --preview-window=OPT Preview window layout (default: right:50%)
    #                      [up|down|left|right][:SIZE[%]][:hidden][:+SCROLL[-OFFSET]]

  # Scripting
    # -q, --query ""       specify the initial query
    # --cmd-query ""       specify the initial query for interactive mode
    # --expect KEYS        comma seperated keys that can be used to complete skim
    # --read0              Read input delimited by ASCII NUL(\0) characters
    # --print0             Print output delimited by ASCII NUL(\0) characters
    # --no-clear           Do not clear screen on exit
    # --print-query        Print query as the first line
    # --print-cmd          Print command query as the first line (after --print-query)
    # --print-score        Print matching score in filter output (with --filter)
    # -1, --select-1       Automatically select the only match
    # -0, --exit-0         Exit immediately when there's no match
    # --sync               Synchronous search for multi-staged filtering
    # --pre-select-n=NUM   Pre-select the first n items in multi-selection mode
    # --pre-select-pat=REGEX
    #                      Pre-select the matched items in multi-selection mode
    # --pre-select-items=$'item1\nitem2'
    #                      Pre-select the items separated by newline character
    # --pre-select-file=FILENAME
    #                      Pre-select the items read from file

  # Environment variables
    # SKIM_DEFAULT_COMMAND Default command to use when input is tty
    # SKIM_DEFAULT_OPTIONS Default options (e.g. '--ansi --regex')
    #                      You should not include other environment variables
    #                      (e.g. '-c "$HOME/bin/ag"')

  # Removed
    # -I replstr           replace `replstr` with the selected item

  # Reserved (not used for now)
    # --extended
    # --literal
    # --cycle
    # --hscroll-off=COL
    # --filepath-word
    # --jump-labels=CHARS
    # --border
    # --no-bold
    # --info
    # --pointer
    # --marker
    # --phony
