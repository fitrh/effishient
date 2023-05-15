if not status is-login
    return
end

set -l OPTIONS "-Dawt.useSystemAAFontSettings=gasp" \
    "-Dswing.aatext=true" \
    "-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel" \
    "-Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

set -x JAVA_TOOL_OPTIONS $OPTIONS
set -x JAVA_RUNTIMES $LOCAL_LIB/jvm
set -x JAVA_HOME $JAVA_RUNTIMES/default
set -x JAVA_WORKSPACE $HOME/dev/0_icebox/java/workspace
set -x JDTLS_HOME $LOCAL_LIB/jdt.ls
