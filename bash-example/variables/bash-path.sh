#!/bin/bash

if ! $x;then
  echo ""
  echo -e "This is Difference of \$x and \${BASH_SOURCE[x]}"
  echo ""
  echo -e "${KMAG}\${0}: ${KNRM}${0}"
  echo -e "${KMAG}\${BASH_SOURCE[0]}: ${KNRM}${BASH_SOURCE[0]}"
else
  x=false
  cur=$(realpath $(dirname $0))
  cd ..
  source ${cur}/bash-path.sh
fi
