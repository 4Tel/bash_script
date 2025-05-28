#!/usr/bin/env bash

from=123
tooo=456
from=456
tooo=123

target=test/001

sed "s/${from}/${tooo}/g" $target -i
