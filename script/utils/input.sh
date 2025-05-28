#!/usr/bin/env bash

read_path() {
  local user_input
  read -rep $'\ntarget path: ' user_input
  echo "$user_input"
}

# ref) https://www.linuxquestions.org/questions/linux-general-1/commandline-autocompletion-for-my-shell-script-668388/
## emacs mode to use tab-completion
set -o emacs
## enable tab-completion
bind 'TAB:dynamic-complete-history'
## show completion list
bind 'set show-all-if-ambiguous on'
## ignore case
# bind 'set completion-ignore-case on'
set -o vi
read_list() {
  local _prompt, _options
  set -o emacs
  # clear history
  history -c

  _prompt="$(printf "\n%s: " "$1")"
  _options="$2"
  # add completion to history
  while IFS=$'\n' read -r i; do
    history -s "$i"
  done <<<"$_options"

  read -rep "$_prompt" arg
  set -o vi
  echo "$arg"
}
