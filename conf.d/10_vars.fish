set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_STATE_HOME $HOME/.local/state

set -gx LOCAL_BIN $HOME/.local/bin
set -gx LOCAL_LIB $HOME/.local/lib
set -gx LOCAL_SCRIPT $HOME/.local/scripts
set -gx LOCAL_SRC $HOME/.local/src

set -gx ANDROID_HOME $LOCAL_LIB/sdk/android
set -gx ANDROID_NDK_HOME $LOCAL_LIB/sdk/android/ndk/21.0.6113669
set -gx ANDROID_SDK_ROOT $LOCAL_LIB/sdk/android
set -gx BAT_THEME ansi
set -gx BINARYEN_ROOT $HOME/.local
set -gx CABAL_DIR $LOCAL_LIB/haskell/cabal
set -gx CARGO_HOME $LOCAL_LIB/rust/cargo
set -gx CHROME_EXECUTABLE (which chromium)
set -gx COMPOSER_BIN_DIR $LOCAL_LIB/php/composer/bin
set -gx DART_SDK $LOCAL_LIB/dart/sdk
set -gx DESKTOP_BG "Earth & The Satellite.png"
set -gx DENO_INSTALL $LOCAL_LIB/deno
set -gx DENO_INSTALL_ROOT $DENO_INSTALL/bin
set -gx DOTNET_ROOT $LOCAL_LIB/dotnet
set -gx EDITOR $HOME/apps/neovim/bin/nvim
set -gx EMSCRIPTEN_ROOT $HOME/git/emscripten
set -gx FLUTTER_ROOT $LOCAL_LIB/sdk/flutter
set -gx FZF_DEFAULT_OPTS --reverse
set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "--preview 'bat -p --color=always {}'"
set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "--preview-window=right,65%,cycle"
set -gx GHCUP_USE_XDG_DIRS true
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx GOPATH $LOCAL_LIB/go
set -gx GPG_TTY (tty)
set -gx LC_ALL en_US.UTF-8
set -gx npm_config_prefix $LOCAL_LIB/node_modules
set -gx PUB_CACHE $LOCAL_LIB/dart/pub-cache
set -gx STACK_ROOT $LOCAL_LIB/haskell/stack
set -gx TERMINFO $XDG_DATA_HOME/terminfo
set -gx RUSTUP_HOME $LOCAL_LIB/rust/rustup
set -gx RUST_BACKTRACE 1
set -gx VIMPKG $XDG_DATA_HOME/nvim/site/pack
set -gx VISUAL $HOME/apps/neovim/bin/nvim
set -gx XCURSOR_THEME capitaine-cursors
set -gx XMONAD_DATA_DIR $XDG_DATA_HOME/xmonad
set -gx XMONAD_CONFIG_DIR $XDG_CONFIG_HOME/xmonad
set -gx XMONAD_CACHE_DIR $XDG_CACHE_HOME/xmonad
