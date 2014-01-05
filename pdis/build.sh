#!/bin/bash

if [[ "$#" -eq 1 ]]; then

  if [[ "$1" =~ s|S ]]; then
    make techreport._show
  else
    echo "Invalid argument"
  fi

else
  make techreport
fi
