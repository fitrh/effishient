set -l OPTIONS "-Dawt.useSystemAAFontSettings=gasp" \
    "-Dswing.aatext=true" \
    "-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel" \
    "-Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

set -gx JAVA_TOOL_OPTIONS $OPTIONS
set -gx JAVA_HOME $LOCAL_LIB/jvm/default
set -gx JAVA_WORKSPACE $HOME/dev/sandbox/java/workspace
set -gx JDTLS_HOME $HOME/git/eclipse.jdt.ls
