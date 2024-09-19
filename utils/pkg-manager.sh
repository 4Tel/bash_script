#!/bin/bash
cur="$(realpath $(dirname "$0"))"
echo $cur


# list of pakage manager
pms=("apt" "apt-get" "brew" "yum" "dnf" "zypper" "pacman")

found=false
# find valid pakage manager
for pm in "${pms[@]}"; do
done

if ! $found;then
  echo "Cannot Find Valid Pakage Manager"
fi
exit 1
