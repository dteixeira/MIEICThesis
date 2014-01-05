#!/bin/bash

# Remove existent PDF file.
rm techreport.pdf 2> /dev/null

# Build report.
if [[ "$#" -eq 1 ]]; then

  if [[ "$1" =~ s|S ]]; then
    make techreport._show
  else
    echo "Invalid argument"
  fi

else
  make techreport
fi

# Clean compilation files.
make clean
