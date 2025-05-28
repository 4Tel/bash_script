#!/usr/bin/env bash
timeout=0.7
move=(A B C D)
direct=(UP DOWN RIGHT LEFT)
s="\033["
comment=(5A 0D 3A "2A${s}3D")
cursor=(4B 1B 3B "2B${s}3C")

echo -e "\n\n\n\n"
sleep $timeout

for x in {0..3}; do
	echo -ne "${s}${comment[$x]}"
	echo -ne " - ${direct[$x]}: ${KMAG}"
	echo -n "$s{N}${move[$x]}"
	echo -ne "${KNRM}${s}${cursor[$x]}\033[999D"
	echo -ne "${s}3${move[$x]}"
	sleep $timeout
done
#echo -ne "${s}3
