#!/bin/sh

which kpsepath >/dev/null 2>&1

if [ ${?} -ne 0 ]
then
  echo "Please install kpsepath "
  exit 1
fi

which dlocate >/dev/null 2>&1

if [ ${?} -ne 0 ]
then
  echo "Please install dlocate"
  exit 1
fi

kpsepath tex | tr ':' '\n' | perl -ne 'm-^(!!)?(/.*?)(//)?$- && print "$2\n"' | while read path; do dlocate --package-only $path ; done | sort -u
