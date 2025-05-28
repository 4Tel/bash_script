#!/usr/bin/env bash

# 원본 문자열
string="123"

# -e 옵션으로 echo에서도 format string 사용 가능
# \033으로 글자색 지정 가능
echo -e "${KRED}소수점 표현${KNRM}"
printf "%.4f\n\n" $string

# 괄호를 사용할 땐 따옴표가 필수이다.
echo -e "${KRED}큰 따옴표와 작음 따옴표 차이(escape)${KNRM}"
# 작은 따옴표는 \로 escape 문자 처리한다.
printf '작은 따옴표 : \\\n'
# 큰 따옴표는 \\로 escape 문자 처리한다.
printf "큰 따옴표   : \\\n\n\n"

echo -e "${KRED}큰 따옴표와 작은 따옴표 차이(variable)${KNRM}"
printf '작은 따옴표 : ${string}\n'
printf "큰 따옴표 : ${string}\n\n"

echo -e "${KRED}%s와 %b의차이${KNRM}"
# %s는 escape string 처리X
printf '%%s : %s 1' '\t'
echo ""
# %b는 escape string 처리O
printf '%%b : %b 1' '\t'
echo -e "\n" # -e 옵션을 통해 echo에서도 format string 적용 가능

echo -e "${KRED}정해진 너비 차지하기${KNRM}"
printf "    10칸 차지 : %10d %10d %10d\n" 1 20 300
printf "    10칸 차지 : %*s %*s %*s\n" 10 1 10 20 10 300
printf " 0으로 채우기 : %06d 13\n" $string
printf " 공백  채우기 : %6s 13\n" "Hi"    # 기본은 우측 정렬
printf "좌측 정렬하기 : %-06s 13\n" "test" # 0은 안 됨
echo ""

echo -e "${KRED}변수로 저장하기${KNRM}"
printf -v var "%o" $string
echo "변수 출력 : ${var}\n"

echo -e "${KRED}날짜 출력하기${KNRM}"
printf "today is %(%Y-%m-%d(%a)  %Z%z %H:%M:%S)T\n"
printf "today is %(%y %b(%B) (%A) %p %I:%M:%S)T\n"
printf "today is %(%c)T\n"
printf "today is %(%x %X)T\n"
