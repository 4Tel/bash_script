#!/usr/bin/env bash

_test_commands() {
  local commands="add commit push pull status xyz"
  mapfile -t commands < <(compgen -W "$commands" -- "${COMP_WORDS[COMP_CWORD]}")
}

complete -F _test_commands test1
