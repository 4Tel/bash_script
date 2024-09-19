#!/bin/bash

# 명령을 문자열 형태로 리스트에 저장
commands=("echo -n \$my_variable")
commands+=("echo -e \"\\n\"")

# 변수 정의
my_variable="Hello, World!"

# eval을 사용하여 문자열로 구성된 명령을 실행
for command in "${commands[@]}";do
  eval $command
done

