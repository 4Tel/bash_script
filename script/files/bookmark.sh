#!/usr/bin/env bash
symbolic_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"
script_dir="$(realpath "$symbolic_dir")"

# (path of util.sh file)
if [ -z "${bash_util}" ] || [ ! -f "${bash_util}" ]; then
  bash_util="${script_dir}/script/utils/util.sh"
fi
# shellcheck source=../utils/util.sh
source "${bash_util}"

# (include here)
include input

# (handle exit signal here)

# (usage here)
usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] 
  [-a][-d][-g]

Enter Directory List

Option:
  -h, --help show this help message and exit
  -a		add bookmark
  -d		delete bookmark
  -g		go to bookmark
EOF
  exit
}

parse_params() {
  if [ $# -eq 0 ]; then usage; fi # require atleast 1 argument
  # (set arguments here)
  OPTIONS="$(getopt -o hadg -l help -- "$@")"
  eval set -- "${OPTIONS}"
  # (set parsing here)
  _state=0
  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -a)
      add_bookmark
      shift
      ;;
    -d)
      delete_bookmark
      shift
      ;;
    -g)
      goto_bookmark
      shift
      ;;
    --)
      shift
      break
      ;;
    esac
  done

  _args=("$@")
  return 0
}

# (script logic here)
bookmark="$BASE/data/bookmark.txt"
mkdir -p "$(dirname "$bookmark")"

add_bookmark() {
  local dir aliase
  dir="$(read_path)"
  while [ ! -d "$dir" ]; do
    msg "No such directory. ${KMAG}${dir}"
    dir="$(read_path)"
  done

  read -rp $'\ntarget alias: ' aliase
  while grep -q "^$aliase:" "$bookmark"; do
    msg "${KMAG}${aliase}${KNRM} already exists"
    read -rp $'\ntarget alias: ' aliase
  done

  home_path=$(realpath "$dir" | sed "s|^$HOME|~|")
  msg "${KMAG}added ${KNRM}$aliase${KMAG}:${KNRM}$home_path"
  echo "$aliase:$home_path" >>"$bookmark"
}

list_bookmark() {
  local _marks, _aliases
  msg "${KMAG}Bookmark List"
  local IFS=$'\n'
  if [ ! -f "$bookmark" ]; then
    die "No bookmark exists."
  fi
  _marks="$(cat "$bookmark")"
  if [ -z "$_marks" ]; then echo 1; fi
  echo "$_marks" | awk -F ":" '{print $1 "	" $2}' | msg
  _aliases="$(echo "$_marks" | awk -F: '{print $1}')"
  read_list "select target" "$_aliases"
}

delete_bookmark() {
  local rst, tmp
  rst="$(list_bookmark)"
  tmp="$(mktemp)"
  while IFS=: read -r a b; do
    if [[ "$a" != "$rst" ]]; then
      echo "$a:$b" >>"$tmp"
    fi
  done <"$bookmark"
  mv "$tmp" "$bookmark"
}

goto_bookmark() {
  rst="$(list_bookmark)"
  while IFS=: read -r a b; do
    if [[ "$a" != "$rst" ]]; then continue; fi
    if [[ $b == ~* ]]; then b="${HOME}${b:1}"; fi
    cd "$b"
  done <"$bookmark"
}

parse_params "$@"
