#!/usr/bin/env bash

if ! sensors >/dev/null 2>&1; then
  echo -e "${KRED}Error${KNRM}: 'sensors' command not found"
  echo -e "Please install the 'lm-sensors' package."
  echo -e "On Debian/Ubuntu: ${KGRN}sudo apt install lm-sensors${KNRM}"
  echo -e "On CentOS/RHEL  : ${KGRN}sudo yum install lm_sensors${KNRM}"
  exit 1
fi

sensors | grep 'Core' sort -k3 | tail -n 1
