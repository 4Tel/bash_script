#!/usr/bin/env bash
# path of symbolic link
symbolic_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"
# path of script file (or hard link)
script_dir="$(realpath "$symbolic_dir")"

# (path of util.sh file)
source "${script_dir}/script/utils/util.sh"

# (handle exit signal here)
#cleanup() {}
#handle_sigint() {}
#handle_sigterm() {}
#handle_error() {}

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
	if [ $# -eq 0 ]; then usage; fi # require atleast 1 argument
	# -o: short / -l:long / :: require param
	OPTIONS="$(getopt -o hp: -l help,param: -- "$@")"
	eval set -- "${OPTIONS}"
	# parsing
	while :; do
		case "${1-}" in
		-h | --help) usage ;;
		-p | --param)
			_param="${2-}"
			shift 2
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
parse_params "$@"

# (script logic here)
