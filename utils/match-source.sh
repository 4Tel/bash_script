#!/bin/bash

cur=$(realpath $(dirname $0))
cur=$(dirname ${BASH_SOURCE[0]})
echo $cur
echo $0
echo ${BASH_SOURCE[0]}
