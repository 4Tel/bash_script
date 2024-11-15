#!/usr/bin/env bash
# path of symbolic link
symbolic_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"
# path of script file (or hard link)
script_dir="$(realpath $symbolic_dir)"

# path of util.sh file
source "${script_dir}/script/utils/util.sh"

# script when exit script
cleanup() {
	trap - EXIT
}
handle_sigint() {
	trap - SIGINT
	cleanup
}
handle_sigterm() {
	trap - SIGTERM
	cleanup
}
handle_error() {
	trap - ERR
	msg "Error on line $1: $2" 1
}

# help massage
usage() {
	cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] 
	-p param_value arg1 [arg2...]

(Script description)

Option:
 	-h, --help      show this help message and exit
 	-p, --param     (parameter description)
EOF
 	exit
}

# parameter 
parse_params() {
	if [ $# -eq 0 ];then usage;exit 1;fi # require atleast 1 argument
	# -o: short / -l:long / :: require param
	OPTIONS="$(getopt -o hp: -l help,param: -- "$@")"
	if [ $? -ne 0 ];then exit 1;fi # parsing error
	eval set -- "${OPTIONS}"
	# parsing
	while :; do
		case "${1-}" in
	 		-h | --help) usage ;;
 			-p | --param)
				param="${2-}"
				shift 2;;
			--) shift;break;;
		esac
	done

	args=("$@")
	return 0
}
parse_params "$@"

# (script logic here)

