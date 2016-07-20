#!/bin/sh
"/opt/clion/jre/jre/bin/java" -cp "/opt/clion/plugins/git4idea/lib/git4idea-rt.jar:/opt/clion/lib/xmlrpc-2.0.jar:/opt/clion/lib/commons-codec-1.9.jar:/opt/clion/lib/util.jar:/opt/clion/plugins/git4idea/lib/trilead-ssh2.jar" org.jetbrains.git4idea.ssh.SSHMain "$@"
