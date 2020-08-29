#!/bin/zsh

if [ -z "${AB_CLI_HOME}" ]; then
  echo "AB_CLI_HOME environment variable is not set"
  echo "AB CLI is not initialized"
  return
fi

source ${AB_CLI_HOME}/environment.sh
source ${AB_CLI_HOME}/java/abc_java.sh

# Adding folders to the PATH variable for auto completion
export PATH=${PATH}:${AB_CLI_JAVA}
export PATH=${PATH}:${JAVA_TOOLS_MAVEN}/bin