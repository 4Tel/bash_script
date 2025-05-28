#!/usr/bin/env bash

cur=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

export bash_util="${cur}/script/utils/util.sh"

unset cur
