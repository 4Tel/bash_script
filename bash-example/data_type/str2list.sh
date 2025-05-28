#!/usr/bin/env bash

STR="123,456,567 5,343"
mapfile -t STR_ARRAY < <(echo "$STR" | tr "," "\n")
echo "${STR_ARRAY[@]}"
