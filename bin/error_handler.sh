#!/bin/sh
safeRunCommand() {
  cmnd=$1
  $cmnd
  ret_code=$?
  if [ $ret_code != 0 ]; then
    printf "Error: [%d] when executing command: '$cmnd'\n" $ret_code
    exit $ret_code
  fi
}

command="$1"
safeRunCommand "$command"