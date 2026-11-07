#!/bin/sh
# Gradle wrapper launcher (POSIX). The binary gradle-wrapper.jar is generated on first CI run
# (or locally with `gradle wrapper --gradle-version 8.9`), which also refreshes this script.
APP_HOME=$(cd "$(dirname "$0")" && pwd -P) || exit 1
WRAPPER_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
if [ ! -f "$WRAPPER_JAR" ]; then
  echo "ERRO: gradle/wrapper/gradle-wrapper.jar não encontrado." >&2
  echo "Gere com: gradle wrapper --gradle-version 8.9   (o GitHub Actions deste projeto faz isso automaticamente)" >&2
  exit 1
fi
if [ -n "$JAVA_HOME" ]; then JAVACMD="$JAVA_HOME/bin/java"; else JAVACMD="java"; fi
exec "$JAVACMD" -Xmx64m -Xms64m $JAVA_OPTS $GRADLE_OPTS "-Dorg.gradle.appname=gradlew" \
  -classpath "$WRAPPER_JAR" org.gradle.wrapper.GradleWrapperMain "$@"
