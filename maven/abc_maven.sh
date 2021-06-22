#!/bin/bash

if [ -z "${AB_CLI_HOME}" ]; then
  echo "AB_CLI_HOME environment variable is not set"
  echo "AB CLI is not initialized"
  return
fi

function abc_maven_init_empty() {
    source ${AB_CLI_HOME}/environment.sh
    source ${AB_CLI_HOME}/abc_functions.sh

    if [[  -z "$1" || -z "$2" ]]; then
        log_error "No arguments provided"
        log_error "Usage: abc_maven_init_empty groupId artifactId"
        return
    fi

    group_id=$1
    artifact_id=$2

    echo "Init the EMPTY Apache Maven project with groupId ${group_id} and artifactId ${artifact_id}"

    mvn archetype:generate \
        -DgroupId=${group_id} \
        -DartifactId=${artifact_id} \
        -DarchetypeArtifactId=maven-archetype-quickstart \
        -DarchetypeVersion=1.4 \
        -DinteractiveMode=false
}