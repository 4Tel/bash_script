#!/usr/bin/env bash

# silent mode 를 설정하기 위해 옵션 스트링의 맨 앞부분에 ':' 문자를 추가
while getopts ":a:" opt; do
    case $opt in
    a)
        echo >&2 "MSG: -a was triggered, argument: $OPTARG"
        ;;
    \?) # \? 는 escape 했으므로 glob 문자가 아님.
        echo >&2 "ERR: Invalid option: -$OPTARG"
        exit 1
        ;;
    :)
        echo >&2 "ERR: Option -$OPTARG requires an argument."
        exit 1
        ;;
    esac
done
