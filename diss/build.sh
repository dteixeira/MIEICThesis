#!/bin/bash

# Build report.
if [[ "$#" -eq 1 ]]; then
  if [[ "$1" =~ s|S ]]; then
    # Remove existent PDF file.
    rm report.pdf 2> /dev/null
    make report._show
  elif [[ "$1" =~ m|M ]]; then
    # Make a copy of the PDF file.
    if [ "$(uname)" == "Darwin" ]; then
      MD5=$(md5 -r ./report.pdf | awk '{ print $1; }')
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
      MD5=$(md5sum ./report.pdf | awk '{ print $1; }')
    fi
    cp ./report.pdf "$MD5.pdf"
  else
    echo "Invalid argument"
  fi
else
  # Remove existent PDF file.
  rm report.pdf 2> /dev/null
  make report
fi

# Clean compilation files.
make clean
