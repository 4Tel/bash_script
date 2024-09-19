#!/bin/bash
function print() { echo >&2 "$@"; }
# ref) https://mug896.github.io/bash-shell/getopts.html

# 외부 명령인 getopt를 이용해 long option도 parse

# short options
# getopt -o a:bc

# long options
# comma-seperate
# --name foo / -name=foo
# getopt -l help,path:,name:

function parse_options() {
  print -e "\n${KGRN}option given $@${KNRM}"
  # --는 항상 맨 끝에 붙는다.
  OPTIND=1
  options=$(getopt -o a:bc -l help,path:,name: -- "$@")
  print -e "${KBLU}getopt result $options${KNRM}"

  eval set -- $options
  while true;do
    case $1 in
      -h|--help) print "option: $1";shift 1;;
      -p|--path) print "option: $1, OPTARG: $2";shift 2;;
      -a) print "option: $1, OPTARG: $2";shift 2;;
      -b) print "option: $1";shift 1;;
      --) shift 1;break;;
      *) print "option: $1, OPTARG:$2";break;;
    esac
  done

  shift $(( OPTIND - 1 ))
  count=1
  for param in "$@";do
    print "parameter #$count: $param"
    count=$[ $count + 1 ]
  done
}
# invalid option given
parse_options -x
parse_options --xx
parse_options -a
parse_options --name

# 옵션이 잘 정렬되고, 따옴표로 감싸짐.
parse_options --path=/usr/bin -a123
parse_options -a 1 2 -b
