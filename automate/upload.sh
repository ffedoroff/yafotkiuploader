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

albumsCount=`./yaploader albumscount`

#echo $dirs
for dir in $dirs
do
  echo uploading $dir
  ./yaploader create-album --title="$dir"
  let "albumsCount = $albumsCount + 1"

  files=`ls "$src/$dir/"`
  filesCount=`ls "$src/$dir/" | wc -l`
  fileIndex=0
  for file in $files
  do
    let "fileIndex = $fileIndex + 1"
    filePath="$src/$dir/$file"
    echo "($fileIndex from $filesCount) $file"
    uploadResult=`./yaploader upload -a $albumsCount "$filePath"`
#    echo "ok"
    rm $filePath
#    exit
  done
  rmdir "$src/$dir"
exit
done
