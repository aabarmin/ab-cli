#!/bin/zsh

if [ -z "${AB_CLI_HOME}" ]; then
  echo "AB_CLI_HOME environment variable is not set"
  echo "AB CLI is not initialized"
  return
fi

function abc_java_8() {
  source ${AB_CLI_HOME}/environment.sh

  export JAVA_HOME=${JAVA_TOOLS_JDK_8}
  java -version
}

function abc_java_11() {
  source ${AB_CLI_HOME}/environment.sh

  export JAVA_HOME=${JAVA_TOOLS_JDK_11}
  java -version
}
