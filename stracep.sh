#!/bin/bash

run_strace() {
  one=$1
  two=$2
  if [ "$two" ]; then
    timeout $two strace -q -tt -T -f -o strace-${one}.txt $(pidof "${one}" | sed 's/\([0-9]*\)/-p \1/g')
  else
    strace -q -tt -T -f -o strace-${one}.txt $(pidof "${one}" | sed 's/\([0-9]*\)/-p \1/g')
  fi
}

if [ ! "$1" ]; then
  echo
  echo "usage:"
  echo
  echo "$0 processname"
  echo "$0 processname timeout"
  echo
else
  run_strace $1 $2
fi
exit