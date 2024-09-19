#!/bin/bash
function print() { echo >&2 "$@"; }
# ref) https://mug896.github.io/bash-shell/getopts.html

# linux built-in함수인 getopts를 이용하여 short option 처리
function parse_options() {
  print -e "\n${KGRN}option given $@${KNRM}"
  OPTIND=1
  while getopts :ab:cd opt;do
    case $opt in
      a) print "option: -$opt, OPTIND: $OPTIND";;
      b) print "option: -$opt, OPTIND: $OPTIND, OPTARG: $OPTARG";;
      c) print "option: -$opt, OPTIND: $OPTIND";;
      d) print "option: -$opt, OPTIND: $OPTIND";;
      # Error
      \?) print "Invalid option: $OPTARG";return 1;;
      # no optarg
      :) print "Option -$OPTARG requires an argument";return 1;;
      # default
      *) print "$OPTARG is not the option";;
    esac
  done
  shift $[ $OPTIND - 1 ]
  count=1
  for param in "$@";do
    print "parameter #$count: $param"
    count=$[ $count + 1 ]
  done
}

# invalid option given
parse_options -b
parse_options -x

# parameter를 받지 않는 옵션은 붙여 쓸 수 있다.
# parameter는 붙여 쓸 수 있다.
# -b c / -bc
parse_options -abd -c

# parameter가 잘못된 위치에 존재하는 경우 문제가 생긴다.
parse_options -a 1 -c

