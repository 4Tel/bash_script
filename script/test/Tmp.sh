#!/bin/bash

as() {
  echo "1 2"
}

sf() {
  echo "$1"
}

x=$(sf "$(sf "$(sf "$(as)")")")
echo "$x"
