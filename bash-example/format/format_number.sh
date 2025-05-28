#!/usr/bin/env bash
string="123"

echo -e "${KRED}N진법 출력하기${KNRM}"
printf "10진법 : %s\n" $string
printf "16진법 : %x\n" $string
printf " 8진법 : %o\n" $string
# 2진법은 커맨드가 없어요..
echo " 2진법 : "$(echo "obase=2 ;$string" | bc)
echo " 3진법 : "$(echo "obase=3 ;$string" | bc)
echo "21진법 : "$(echo "obase=21;$string" | bc)
echo ""

echo -e "${KRED}N진법을 10진법으로 출력하기${KNRM}"
printf "10진법 : %d\n" 10
printf "16진법 : %d\n" 010
printf "16진법 : %d\n" 0x10
printf " 8진법 : %d\n" 0X10

echo -e "${KRED}자료형을 바꾸어 출력하기${KNRM}"
# decimal = integer
printf "signed decimal   : %d %i\n" 10 -10
printf "unsigned decimal : %u %u\n" 10 -10
printf "unsigned octal   : %o %o\n" 10 -10
echo""

echo -e "${KRED}다른 표현으로 출력하기${KNRM}"
printf "과학적 표기법 : %e\n" $string
printf "과학적 표기법 : %E\n" $string
printf "  실수 표기법 : %f\n" $string
printf "과학적or 실수 : %g\n" $string
printf "과학적or 실수 : %Ge\n" $string
printf "16진법   실수 : %a\n" $string
printf "16진법   실수 : %A\n" $string

echo -e "${KRED}편의성 출력 기능${KNRM}"
printf "부호를 포함하기  : %+d %+d\n" 10 -10
printf "${KGRN}부호 자리 비우기${KNRM} : % d\n" 10 -10
printf "구분자 사용하기  : %'d\n\n" 1234567890

echo -e "${KRED}잡다한 기능${KNRM}"
printf "8진법 0으로 시작 : %#o\n" 10
printf "16진법 0x로 시작 : %#x %#X\n" 10 10
printf "유효 소수점 표기 : %#g %#G\n" 1.23 1.23
printf "특정  개수  표기 : %.3g\n" 1.2345
printf "특정 자리수 표기 : %.3f\n" 1.23
printf "문자  출력  제한 : %.3s\n" 1.23
