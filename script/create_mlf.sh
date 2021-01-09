#!/bin/bash


source conf.shlib; # load the config library functions
#load config
user="$(config_get user)"
target="$(config_get target)"
src="$(config_get src)"




#################  create MLF file  #######################
#link to labels file
path="$target/DATA/files.tsv"
files_path="$target/PARAMS/MFCC" 
mkdir -p "$target/lab"



echo -e "#!MLF!#" >> "$target/lab/labels.mlf"

sed 1,1d $path | tr \\11 @ | (
  while IFS=$'@' read -r -a row

	do      
		if test -f "$target/DATA/WAV/${row[1]}.wav"
		then
			echo "-> file :$target/WAV/${row[1]}.wav"
			echo -e "\"$files_path/${row[1]}.lab\"\n${row[6]}\n." >> "$target/lab/labels.mlf"
                fi
	done 
)

