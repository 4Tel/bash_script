#!/usr/bin/env bash
set -E
trap cleanup SIGINT SIGTERM ERR EXIT
cleanup() {
	trap - SIGINT SIGTERM ERR EXIT
	# (Scipt here)
}

symbolic_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"
script_dir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
source "${script_dir}/../setting.sh"
msg "${KRED}test${KNRM}"
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
die() {
 	local msg=$1
 	local code=${2-1} # default exit status 1
 	msg "$msg"
 	exit "$code"
}
parse_params() {
	# require atleast 1 argument
	if [ $# -eq 0 ];then usage;exit 1;fi
	OPTIONS="$(getopt -o hp: -l help,param: -- "$@")"
	# parsing error
	if [ $? -ne 0 ];then exit 1;fi
	eval set -- "${OPTIONS}"
	param=''
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
echo 1
echo $args
# script logic here.
