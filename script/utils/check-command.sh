#!/usr/bin/env bash

function check_command() {
  if command -v $1 &>/dev/null; then
    return 0
  else
    return 1
  fi
}
