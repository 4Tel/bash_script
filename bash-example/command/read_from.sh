#!/bin/bash
function print() { echo >&1 "$@"; }
function a(){
  # print if given from command Line
  print -e "${KGRN}Argument Given From Command Line${KNRM}"
  for ((i=1;i<=$#;i++));do echo "\$$i: ${!i}";done

  # combine both of them
  if ! test -t 0; then
    print -e "${KGRN}Argument Combine From Command Line and STDIN${KNRM}"
    while read -r line; do args+=`printf "%q " "$line"`; done
    eval set -- $args '"$@"'
    for ((i=1;i<=$#;i++));do echo "\$$i: ${!i}";done
    
  fi
  
  # if file descripter 0 (stdin) is not opened on a terminal
  if ! test -t 0; then
    print -e "${KGRN}Argument Given From STDIN${KNRM}"
    # set args to empty
    set --
    while read -r line; do args+=`printf "%q " "$line"`; done
    eval set -- $args
    for (( i = 1; i <= $#; i++ )) do echo "\$$i : ${!i}"; done
  fi

  echo ""
}

a 11 22 33
echo -e "11\n22" | a 33
