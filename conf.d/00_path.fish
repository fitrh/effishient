if not status is-login
    return
end

set USER_PATH $USER_PATH ~/.local/bin
set USER_PATH $USER_PATH ~/.local/lib/rust/cargo/bin
set USER_PATH $USER_PATH ~/.local/lib/go/bin
set USER_PATH $USER_PATH ~/.local/lib/dart/pub-cache/bin
set USER_PATH $USER_PATH ~/.local/lib/dart/bin
set USER_PATH $USER_PATH ~/.local/lib/jvm/default/bin
set USER_PATH $USER_PATH ~/.local/lib/kotlin/compiler/bin
set USER_PATH $USER_PATH ~/.local/lib/kotlin/server/bin
set USER_PATH $USER_PATH ~/.local/lib/gradle/bin
set USER_PATH $USER_PATH ~/.local/lib/maven/bin
set USER_PATH $USER_PATH ~/.local/lib/dotnet
set USER_PATH $USER_PATH ~/.local/lib/dotnet/omnisharp
set USER_PATH $USER_PATH ~/.local/lib/node_modules/bin
set USER_PATH $USER_PATH ~/.local/lib/deno/bin
set USER_PATH $USER_PATH ~/.local/lib/php/composer/bin
set USER_PATH $USER_PATH ~/.local/lib/haskell/cabal/bin
set USER_PATH $USER_PATH ~/.local/lib/sdk/android
set USER_PATH $USER_PATH ~/.local/lib/sdk/android/emulator
set USER_PATH $USER_PATH ~/.local/lib/sdk/android/tools
set USER_PATH $USER_PATH ~/.local/lib/sdk/android/tools/bin
set USER_PATH $USER_PATH ~/.local/lib/sdk/android/platform-tools
set USER_PATH $USER_PATH ~/.local/lib/sdk/android/ndk/21.0.6113669
set USER_PATH $USER_PATH ~/.local/lib/sdk/flutter/bin
set USER_PATH $USER_PATH ~/.luarocks/bin
set USER_PATH $USER_PATH ~/.dotnet/tools
set USER_PATH $USER_PATH ~/git/prettierd/bin
set USER_PATH $USER_PATH ~/git/yaml-language-server/bin
set USER_PATH $USER_PATH ~/git/emscripten
set USER_PATH $USER_PATH ~/git/vscode-gradle/gradle-language-server/build/install/gradle-language-server/bin
set USER_PATH $USER_PATH ~/git/fennel-ls
set USER_PATH $USER_PATH ~/.local/script
set USER_PATH $USER_PATH /usr/bin/site_perl
set USER_PATH $USER_PATH /usr/bin/vendor_perl
set USER_PATH $USER_PATH /usr/bin/core_perl

set -x PATH $USER_PATH $PATH
