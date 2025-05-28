#!/usr/bin/env bash

nodes=$(pbsnodes -a | grep "Mom = " | awk '{print $3}')
for node in $nodes; do
  echo "$node"
done
