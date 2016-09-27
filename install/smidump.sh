#!/bin/bash

echo ""
filelist=`find /mib -type f`
#echo $filelist
for file in $filelist
do
	extension="${file##*.}"
	filename="${file##*/}"
	filename="${filename%.*}"

	#echo $file, $filename, $extension

	if [ $extension != "mib" ]; then
		filename="${file##*/}"
	fi
	echo "Translating: $file --> yang/$filename.yang"
	smidump -f yang -k $file -o /yang/$filename.yang 2> /yang/$filename.log
done

echo ""
filelist=`find yang -name *.log`
#echo $filelist
for file in $filelist
do
	echo "[$file]"
	cat $file
	echo ""
done


#find /mib -type f | xargs -i echo "---" {} 

