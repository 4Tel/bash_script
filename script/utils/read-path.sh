#!/usr/bin/env bash
msg="$(echo -ne "${KMAG}path: ${KNRM}")"
read -rp "$msg" -e path
cd "$path" || exit
