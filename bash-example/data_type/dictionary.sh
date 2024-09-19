#!/bin/bash

declare -A dict=( 
	['a']='b' 
	['c']='d'
)

dict['e']='f'

for key in "${!dict[@]}";do
  echo -e "value of ${KMAG}${key}${KNRM} is: ${KMAG}${dict[$key]}${KNRM}"
done

