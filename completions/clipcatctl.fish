complete -c clipcatctl -n "__fish_use_subcommand" -s c -l config -d 'Specifies a configuration file'
complete -c clipcatctl -n "__fish_use_subcommand" -s h -l host -d 'Specifies a server host'
complete -c clipcatctl -n "__fish_use_subcommand" -s p -l port -d 'Specifies a server port'
complete -c clipcatctl -n "__fish_use_subcommand" -l log-level -d 'Specifies a log level'
complete -c clipcatctl -n "__fish_use_subcommand" -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_use_subcommand" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "version" -d 'Prints version information'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "completions" -d 'Outputs shell completion code for the specified shell (bash, zsh, fish)'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "default-config" -d 'Outputs default configuration'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "insert" -d 'Inserts new clip into clipboard'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "insert-primary" -d 'Inserts new clip into primary clipboard'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "load" -d 'Loads file into clipboard'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "load-primary" -d 'Loads file into primary clipboard'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "save" -d 'Pastes content of current clipboard into file'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "save-primary" -d 'Pastes content of current primary clipboard into file'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "get" -d 'Prints clip with <id>'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "list" -d 'Prints history of clipboard'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "update" -d 'Updates clip with <id>'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "edit" -d 'Edits clip with <id>'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "remove" -d 'Removes clips with [ids]'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "promote" -d 'Replaces content of clipboard with clip with <id>'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "promote-primary" -d 'Replaces content of primary clipboard with clip with <id>'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "clear" -d 'Removes all clips in clipboard'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "length" -d 'Prints length of clipboard history'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "enable-monitor" -d 'Enable clipboard monitor'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "disable-monitor" -d 'Disable clipboard monitor'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "toggle-monitor" -d 'Toggle clipboard monitor'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "get-monitor-state" -d 'Get clipboard monitor state'
complete -c clipcatctl -n "__fish_use_subcommand" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c clipcatctl -n "__fish_seen_subcommand_from version" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from version" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from completions" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from completions" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from default-config" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from default-config" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from insert" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from insert" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from insert-primary" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from insert-primary" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from load" -s f -l file
complete -c clipcatctl -n "__fish_seen_subcommand_from load" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from load" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from load-primary" -s f -l file
complete -c clipcatctl -n "__fish_seen_subcommand_from load-primary" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from load-primary" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from save" -s f -l file
complete -c clipcatctl -n "__fish_seen_subcommand_from save" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from save" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from save-primary" -s f -l file
complete -c clipcatctl -n "__fish_seen_subcommand_from save-primary" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from save-primary" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from get" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from get" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from list" -l no-id
complete -c clipcatctl -n "__fish_seen_subcommand_from list" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from list" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from update" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from update" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from edit" -s e -l editor
complete -c clipcatctl -n "__fish_seen_subcommand_from edit" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from edit" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from remove" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from remove" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from promote" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from promote" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from promote-primary" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from promote-primary" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from clear" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from clear" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from length" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from length" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from enable-monitor" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from enable-monitor" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from disable-monitor" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from disable-monitor" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from toggle-monitor" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from toggle-monitor" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from get-monitor-state" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from get-monitor-state" -s V -l version -d 'Prints version information'
complete -c clipcatctl -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c clipcatctl -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
