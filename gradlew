#!/bin/sh

set -e

DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
JAVA_BIN="${JAVA_HOME:+$JAVA_HOME/bin/java}"
if [ -z "$JAVA_BIN" ]; then
  JAVA_BIN=java
fi

exec "$JAVA_BIN" -classpath "$DIR/gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"

