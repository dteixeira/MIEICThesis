#!/bin/bash

# Build report.
if [[ "$#" -eq 1 ]]; then
  if [[ "$1" =~ sp|SP ]]; then
    # Remove existent PDF file.
    rm summary_pt.pdf 2> /dev/null
    make summary_pt
    cp summary_pt.pdf view_pt.pdf
    open view_pt.pdf
  elif [[ "$1" =~ s|S ]]; then
    # Remove existent PDF file.
    rm summary.pdf 2> /dev/null
    make summary
    cp summary.pdf view.pdf
    open view.pdf
  elif [[ "$1" =~ p|P ]]; then
    # Remove existent PDF file.
    rm summary_pt.pdf 2> /dev/null
    make summary_pt
    cp summary_pt.pdf view_pt.pdf
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
  rm summary.pdf 2> /dev/null
  make summary
  cp summary.pdf view.pdf
fi

# Clean compilation files.
make clean
