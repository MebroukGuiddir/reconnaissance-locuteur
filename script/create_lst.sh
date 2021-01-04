#!/bin/bash


source conf.shlib; # load the config library functions
#load config
user="$(config_get user)"
target="$(config_get target)"
src=="$(config_get src)"

##################### create description files ##############

mkdir -p "$target/list"
path="$target/DATA/TRAIN/"
for i in $path*.wav
do
     echo "Working on : /DATA/TRAIN/$(basename -s .wav "$i").wav"
    echo  "$target/DATA/WAV/$(basename -s .wav "$i").wav $target/PARAMS/MFCC/$(basename -s .wav "$i").mfcc" >> "$target/list/files.lst"
    echo  "$target/DATA/WAV/$(basename -s .wav "$i").wav $target/PARAMS/MFCC/$(basename -s .wav "$i").mfcc" >> "$target/list/train.lst"
done


path="$target/DATA/TEST/"
for i in $path*.wav
do
    echo "Working on : /DATA/TEST/$(basename -s .wav "$i").wav"
    echo  "$target/WAV/$(basename -s .wav "$i").wav $target/PARAMS/MFCC/$(basename -s .wav "$i").mfcc"  >> "$target/list/files.lst"
    echo  "$target/WAV/$(basename -s .wav "$i").wav $target/PARAMS/MFCC/$(basename -s .wav "$i").mfcc"  >> "$target/list/test.lst"
done
