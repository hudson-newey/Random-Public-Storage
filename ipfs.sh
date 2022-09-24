#!/bin/bash

README_HASH="/ipfs/QmQPeNsJPyVWPFDVHb77w8G42Fvo15z4bG2X8D2GhfbSXc/readme";

ipfs init;
ipfs cat $README_HASH;

while true; do
	echo "Input Hash of IPFS Object to Fetch";
	read -p ":" req;

	ipfs cat /ipfs/${req};
done;
