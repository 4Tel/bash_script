idx=0

echo -e ${KRED}run in sub shell / Pipeline${KNRM}
find . | while read file;do
  echo $idx
  ((idx++))
done
echo -e idx: ${KBLU}${idx}${KNRM}

echo -e ${KRED}run in substitution / Redirection${KNRM}
while read file;do
  echo $idx
  ((idx++))
done < <(find .)
echo -e idx: ${KBLU}${idx}${KNRM}
