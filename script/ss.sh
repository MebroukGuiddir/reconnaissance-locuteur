#!/bin/bash


source conf.shlib; # load the config library functions
#load config
user="$(config_get user)"
src="$(config_get src)"

target="$(config_get target)/DATA"


#separate the dataset files into two parts TEST and TRAIN using symbolic links

cpt_m=0
cpt_f=0
mkdir -p  "$target/TEST/MALE"
mkdir -p "$target/TRAIN/MALE"
mkdir -p  "$target/TEST/FEMALE"
mkdir -p "$target/TRAIN/FEMALE"


cat "$src/DATA/files.tsv" | tr \\11 @ | (
  read 
  while IFS=$'@' read -r -a row

	do
	    if [[ ! -f "$target/WAV/${row[1]}.wav" ]]
	    then
		       echo "$target/WAV/${row[1]}.wav"
	    fi
	done
)
