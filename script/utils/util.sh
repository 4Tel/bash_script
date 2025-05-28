#!/usr/bin/env bash
# shellcheck disable=SC2034
#! Reference: https://betterdev.blog/minimal-safe-bash-script-template/

## -x: print command before execute.
## -u: exit bash when unset variable used. (can use {a:-b})
## -e: exit bash when command fails. (only last of pipeline)
## -eo pipefail: exit bash when command fails. (all command in pipeline)
## -E: catch signals.
set -Eeuo pipefail

# dummy functions for trap
cleanup() { return; }
handle_sigint() { return; }
handle_sigterm() { return; }
handle_error() { return; }
### SIGINT: signal of interupt (Ctrl+C, etc.)
### SIGTERM: signal of termination
### ERR: command failure.
### EXIT: exit. (whether success or failure)
### [trap command signals]: call command when catch signal
if [[ "$0" != "${BASH_SOURCE[0]}" ]]; then
	trap handle_sigint SIGINT
	trap handle_sigterm SIGTERM
	trap 'handle_error "$LINENO" "$BASH_COMMAND"' ERR
	trap cleanup EXIT
fi

# set colors
setup_colors() {
	# -t 2: check stderr connect to terminal
	# ${NO_COLOR}: check user setting (use "export NO_COLOR=1")
	# ${TERM-}: Terminal not support color in "dumb"
	if [[ -t 2 ]] && [[ -v NO_COLOR ]] && [[ "${TERM-}" != "dumb" ]]; then
		KNRM='\033[0m' KBLK='\033[0;30m' KRED='\033[0;31m' KGRN='\033[0;32m' KYEL='\033[0;33m' KBLU='\033[0;34m' KMAG='\033[0;35m' KCYN='\033[0;36m' KWHT='\033[0;37m'
	else
		KNRM='' KBLK='' KGRN='' KYEL='' KBLU='' KMAG='' KCYN='' KWHT=''
	fi
}
setup_colors

# output to stdout, msg to stderr
msg() {
	echo >&2 -e "${*-}${KNRM}"
}

# exit program with msg
die() {
	local msg=$1
	local code=${2-1} # default exit status 1
	msg "$msg"
	exit "$code"
}

warn() {
	local msg="$1"
	msg "${KYEL}Warning${KNRM}: $msg"
}
# can save to variable cat-file
read_file() {
	local file="$1"
	if [ ! -f "$file" ]; then
		die "${file}: No such file or directory"
	fi
	local IFS=$'\n'
	mapfile -t content <"$file"
	printf '%s\n' "${content[@]}"
}

util_dir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
# include lib scripts
include() {
	local _parse_str, _path
	_parse_str="$1==search {$1="";printf substr($0,2)}"
	_path
	for lib in "$@"; do
		_path="$(awk -v search="$lib" "$_parse_str" "${util_dir}/libpath.txt")"
		if [ ! -f "$util_dir/$_path" ]; then
			die "${util_dir}/$_path: No such file or directory"
		fi
		# shellcheck disable=SC1090
		source "${util_dir}/$_path"
	done
}

BASE="$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")"
