#!/usr/bin/env bash
# eraise current line
echo -e "eraise current line start to current pos"
echo -ne "123\r"
sleep 1
echo -e "\033[1K"

echo -e "eraise current line start to end pos"
echo -ne "123\r"
sleep 1
echo -e "\033[2K"
