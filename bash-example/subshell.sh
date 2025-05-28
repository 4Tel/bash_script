#!/usr/bin/env bash
# shellcheck disable=SC2030,SC2031,SC2034

idx=0

echo -e "${KRED}"run in sub shell / Pipeline"${KNRM}"
find . | while read -r file; do
  ((idx++))
done
echo -e "idx: ${KBLU}${idx}${KNRM}"

echo -e "${KRED}"run in substitution / Redirection"${KNRM}"
while read -r file; do
  ((idx++))
done < <(find .)
echo -e "idx: ${KBLU}${idx}${KNRM}"
