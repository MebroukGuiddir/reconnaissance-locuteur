#!/bin/bash


source conf.shlib; # load the config library functions
#load config
user="$(config_get user)"
src=="$(config_get src)/DATA/clips"
target="$(config_get target)/DATA"


#separate the dataset files into two parts TEST and TRAIN using symbolic links

path="$target/files.tsv"
cpt_m=0
cpt_f=0
mkdir  "$target/TEST"
mkdir  "$target/TRAIN"


cat $path | tr \\11 @ | (
  while IFS=$'@' read -r -a row

	do
    if test -f "$target/WAV/${row[1]}.wav";
    then
                # skip lines with empty label
                if [[  "${row[6]}" != "" ]];
            		then
            			 echo "Working on : "
                                 echo " -file : $target/WAV/${row[1]}.wav"
                                 echo " -label : ${row[6]}               "
            			 if [[ ${row[6]} == "male" ]];
                                     then
                                         echo " -cpt : $cpt_m"
            				 if [ $cpt_m -eq 3 ]
            				 then

            				   ln -s "$target/WAV/${row[1]}.wav" "$target/TEST"
            				   cpt_m=0
            				 else
            				   ln -s "$target/WAV/${row[1]}.wav" "$target/TRAIN"
            				   cpt_m=$((cpt_m+1))
            				 fi

            			 elif [[ ${row[6]} == "female" ]];
            			 then
					 echo " -cpt : $cpt_f"
            				 if [ $cpt_f -eq 3 ]
            				 then

            				   ln -s "$target/WAV/${row[1]}.wav" "$target/TEST"
            				   cpt_f=0
            				 else
            				   ln -s "$target/WAV/${row[1]}.wav" "$target/TRAIN"
            				   cpt_f=$((cpt_f+1))
            				 fi
            			 fi
            		fi
    fi
	done
)
