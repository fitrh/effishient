set -l OPTIONS "-Dawt.useSystemAAFontSettings=gasp" \
    "-Dswing.aatext=true" \
    "-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel" \
    "-Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

set -x JAVA_TOOL_OPTIONS $OPTIONS
set -x JAVA_HOME $LOCAL_LIB/jvm/default
set -x JAVA_WORKSPACE $HOME/dev/sandbox/java/workspace
set -x JDTLS_HOME $HOME/git/eclipse.jdt.ls
