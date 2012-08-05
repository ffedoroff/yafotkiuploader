#!/bin/bash

yfu="/home/roman/yafotkiuploader"
src="$yfu/to_upload"
#src=`pwd`
IFS=$(echo -en "\n\b")
cd $src
#echo $src
dirs=`ls -d */ "$src/"`
dirs=${dirs/$src/}
dirs=${dirs//\//}

cd ..
#echo $dirs
for dir in $dirs
do
  echo uploading $dir
  ./yaploader create-album --title="$dir"

  files=`find "$src/$dir/" -iregex '.*\(jpg\|jpeg\|png\)' -printf '%f\n'`
  for file in $files
  do
    filePath="$src/$dir/$file"
    echo $filePath
    ./yaploader upload -a 2 "$filePath"
    rm $filePath
  done
exit
done

