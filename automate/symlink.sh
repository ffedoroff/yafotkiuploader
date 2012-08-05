#!/bin/bash

src=`pwd`
IFS=$(echo -en "\n\b")
dirs=`ls -d */ "$src/"`
dirs=${dirs/$src/}
dirs=${dirs//\//}

#echo $dirs
for dir in $dirs
do
  echo "----"
  echo $dir


  files=`find "$src/$dir/" -iregex '.*\(jpg\|jpeg\|png\)' -printf '%f\n'`
  for file in $files
  do
    echo $file
  done

 #exit
done
