#!/usr/bin/env bash
nodes=$(pbsnodes -a | grep "Mom = " | awk '{print $3}')
for node in $nodes; do
  echo -e "${KCYN}Highest Temperature of ${KGRN}$node${KNRM}"
  ssh "$node" "bash -s" <../hardware/temp.sh
done
