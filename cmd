

./HTK/HTKTools/HCompV -C config -f 0.01 -m -S list/train.lst -M hmm0 model/models.lst 



./HTK/HTKTools/HVite -C model/config -w model/out  -H model/hmm0/hmmH -H model/hmm0/hmmF  -S list/testF.lst -i model/result/testF model/dictionnaire list/hmm.lst 





./HTK/HTKTools/HCompV -m -T 1 -C model/config -M model/hmm_init model/hmm0/hmmF -S list/trainF.lst


./HTK/HTKTools/HCompV -m -T 1 -C model/config -M model/hmm_init model/hmm0/hmmH -S list/trainM.lst 

./HTK/HTKTools/HRest  -C model/config -t 250.0 150.0 100.0 -T 1 -M model/hmm_train model/hmm_init/hmmF -S  list/trainF.lst

./HTK/HTKTools/HRest  -C model/config -T 1 -M model/hmm_train model/hmm_init/hmmH -S  list/trainM.lst



./HTK/HTKTools/HParse model/grammaire model/out

 ./HTK/HTKTools/HVite -C model/config -w model/out -t 250.0 150.0 100.0 -T 1  -H model/hmm_train/hmmH -H model/hmm_train/hmmF  -S list/testF.lst -i result/testF model/dict list/hmm.lst 

