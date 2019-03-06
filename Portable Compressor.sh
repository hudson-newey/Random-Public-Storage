#!/bin/bash

printf "File to Decompress"
read DecompressFile

#functions
function pause(){
   read -p "$*"
}

echo ""
echo Decompressing $DecompressFile
URL = cat $DecompressFile

rm $DecompressFile
curl $url>>./$DecompressFile + ".txt"

pause 'Done! Press [Enter] key to continue...'
