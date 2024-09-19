#!/bin/bash
# ref) https://jason-heo.github.io/programming/2020/12/05/bash-options.html
function usage()
{
    cat <<EOM
Usage: $0 [options] <url>
Options:
 -X, -request COMMAND   Specify request command to use
 -v, --verbose           Make the operation more talkative
EOM

    exit 1
}

function set_options()
{
    while [ "${1:-}" != "" ]; do
        case "$1" in
            -X | -request)
                shift
                request_method=$1
                ;;
            -v | --verbose)
                verbose_mode="true"
                ;;
            -u | --url)
                shift
                url=$1
                ;;
            *)
                usage
                ;;
        esac
        shift
    done
}

set_options "$@"

echo "request_method='${request_method}'"
echo "verbose_mode='${verbose_mode}'"
echo "url='${url}'"
