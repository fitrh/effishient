set -x XDG_DATA_DIRS "/usr/local/share:/usr/share:/home/fitrh/.local/share"
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_STATE_HOME $HOME/.local/state

set -x LOCAL_BIN $HOME/.local/bin
set -x LOCAL_LIB $HOME/.local/lib
set -x LOCAL_SCRIPT $HOME/.local/script
set -x LOCAL_SRC $HOME/.local/src

set -x ANDROID_HOME $LOCAL_LIB/sdk/android
set -x ANDROID_NDK_HOME $LOCAL_LIB/sdk/android/ndk/21.0.6113669
set -x ANDROID_SDK_ROOT $LOCAL_LIB/sdk/android
set -x BAT_THEME ansi
set -x BINARYEN_ROOT $HOME/.local
set -x CABAL_DIR $LOCAL_LIB/haskell/cabal
set -x CARGO_HOME $LOCAL_LIB/rust/cargo
set -x CHROME_EXECUTABLE (which chromium)
set -x COMPOSER_BIN_DIR $LOCAL_LIB/php/composer/bin
set -x DART_SDK $LOCAL_LIB/dart/sdk
set -x DESKTOP_BG "Earth & The Satellite.png"
set -x DENO_INSTALL $LOCAL_LIB/deno
set -x DENO_INSTALL_ROOT $DENO_INSTALL/bin
set -x DOTNET_ROOT $LOCAL_LIB/dotnet
set -x EDITOR $HOME/apps/neovim/bin/nvim
set -x EMSCRIPTEN_ROOT $HOME/git/emscripten
set -x FLUTTER_ROOT $LOCAL_LIB/sdk/flutter
set -x FZF_DEFAULT_OPTS --reverse
set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "--preview 'bat -p --color=always {}'"
set FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "--preview-window=right,65%,cycle"
set -x GHCUP_USE_XDG_DIRS true
set -x GHCUP_INSTALL_BASE_PREFIX $HOME/.local
set -x GNUPGHOME $XDG_DATA_HOME/gnupg
set -x GOPATH $LOCAL_LIB/go
set -x GPG_TTY (tty)
set -x GRADLE_USER_HOME $XDG_CACHE_HOME/gradle
set -x LC_ALL en_US.UTF-8
set -x MAVEN_USER_HOME $XDG_CACHE_HOME/maven
set -x npm_config_prefix $LOCAL_LIB/node_modules
set -x PUB_CACHE $LOCAL_LIB/dart/pub-cache
set -x STACK_ROOT $LOCAL_LIB/haskell/stack
set -x TERMINFO $XDG_DATA_HOME/terminfo
set -x RUSTUP_HOME $LOCAL_LIB/rust/rustup
set -x RUST_BACKTRACE 1
set -x VIMPKG $XDG_DATA_HOME/nvim/site/pack
set -x VISUAL $EDITOR
set -x XCURSOR_THEME capitaine-cursors
set -x XMONAD_DATA_DIR $XDG_DATA_HOME/xmonad
set -x XMONAD_CONFIG_DIR $XDG_CONFIG_HOME/xmonad
set -x XMONAD_CACHE_DIR $XDG_CACHE_HOME/xmonad
