#!/bin/bash

printf "File to Decompress"; echo
read DecompressFile

#functions
function pause(){
   read -p "$*"
}

echo ""
echo Decompressing $DecompressFile
URL = cat $DecompressFile

rm $DecompressFile
curl "https://pastebin.com/raw/" + $url>>./$DecompressFile + ".txt"

pause 'Done! Press [Enter] key to continue...'
