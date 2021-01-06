

./HTK/HTKTools/HCompV -C config -f 0.01 -m -S list/train.lst -M hmm0 model/models.lst 

./HTK/HTKTools/HParse model/gram dict

./HTK/HTKTools/HVite -C model/config -w model/out  -H hmmH -H hmmF  -S list/train.lst -i fileout dict list/hmm.lst 

