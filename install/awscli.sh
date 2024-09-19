#!/bin/bash
msg="$(printf "${KMAG}path: ${KNRM}")"
read -p "$msg" -e path
cd $path


