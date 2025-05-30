#!/usr/bin/env bash
symbolic_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"
script_dir="$(realpath "$symbolic_dir")"

# (path of util.sh file)
if [ -n "${bash_util}" ] && [ -f "${bash_util}" ]; then
	# shellcheck source=script/utils/util.sh
	source "${bash_util}"
else
	source "${script_dir}/script/utils/util.sh"
fi
# (include here)

# (handle exit signal here)
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
	#	trap - ERR
	msg "Error on line $1: $2" 1
}

# (usage here)
usage() {
	cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] 

(Script description)

Option:
 	-h, --help      show this help message and exit
EOF
	exit
}

parse_params() {
	if [ $# -eq 0 ]; then usage; fi # require atleast 1 argument
	# (set arguments here)
	OPTIONS="$(getopt -o h -l help -- "$@")"
	if [ $? -ne 0 ]; then exit 1; fi
	eval set -- "${OPTIONS}"
	# (set parsing here)
	while :; do
		case "${1-}" in
		-h | --help) usage ;;
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
