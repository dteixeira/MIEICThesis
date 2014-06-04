#!/bin/bash

# Remove existent PDF file.
rm report.pdf 2> /dev/null

# Build report.
if [[ "$#" -eq 1 ]]; then

  if [[ "$1" =~ s|S ]]; then
    make report._show
  else
    echo "Invalid argument"
  fi

else
  make report
fi

# Clean compilation files.
make clean
