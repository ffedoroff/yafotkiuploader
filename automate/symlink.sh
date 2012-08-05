#!/bin/bash

destinationPah="/home/roman/yafotkiuploader/to_upload"

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
  mkdir -p "$destinationPah/$dir"

  files=`find "$src/$dir/" -iregex '.*\(jpg\|jpeg\|png\)' -printf '%f\n'`
  for file in $files
  do
    ln -s -f "$src/$dir/$file" "$destinationPah/$dir/$file"
#    exit
  done

#exit
done
