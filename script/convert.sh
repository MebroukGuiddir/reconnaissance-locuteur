#!/bin/bash


source conf.shlib; # load the config library functions
#load config
user="$(config_get user)"


src="$(config_get src)/DATA/clips"

target="$(config_get target)/DATA"



### convert mp3 files to wav files
mkdir -p $target"/WAV"
for i in $src/*.mp3
do
    sox "$i" $target"/WAV/$(basename -s .mp3 "$i").wav"
done


