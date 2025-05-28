#!/usr/bin/env bash

# list of pakage manager
pms=("apt" "apt-get" "brew" "yum" "dnf" "zypper" "pacman")

found=false
# find valid package manager
for pm in "${pms[@]}"; do
  if command -v "$pm" &>/dev/null; then
    echo "Found Package Manager: $pm"
    found=true
  fi
done

if ! $found; then
  echo "Cannot Find Valid Package Manager"
  exit 1
fi
