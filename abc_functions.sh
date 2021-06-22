#!/bin/bash

source ${AB_CLI_HOME}/abc_log.sh

function read_value() {
    if [[ -z "$1" ]]; then
        log_error "Invalid usage of the function: "
        log_error "read_value 'What is your name?'"
        return
    fi

    result=""
    while [ -z "${result}" ]; do
        log "$1"
        read result
    done

    echo result
}