#!/usr/bin/env bash
# shellcheck disable=SC2066

echo -ne "$KGRN"
echo "==================="
echo "\$* : args as string"
echo "==================="
echo -ne "$KNRM"
# 인자들을 문자열로 취급
for x in "$*"; do echo "$x"; done

echo -ne "$KGRN"
echo "==================="
echo "\$@ : args as array"
echo "==================="
echo -ne "$KNRM"
# 인자들을 배열로   취급
for x in "$@"; do echo "$x"; done

echo -ne "$KGRN"
echo "==================="
echo "\$# : count of args"
echo "==================="
echo -ne "$KNRM"
echo "$#"
