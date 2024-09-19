#!/bin/bash

STR="123,456,567 5,343"
STR_ARRAY=(`echo $STR | tr "," "\n"`)
echo ${STR_ARRAY[@]}

