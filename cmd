

./HTK/HTKTools/HCompV -C config -f 0.01 -m -S list/train.lst -M hmm0 model/models.lst 



./HTK/HTKTools/HVite -C model/config -w model/out  -H model/hmm0/hmmH -H model/hmm0/hmmF  -S list/testF.lst -i model/result/testF model/dictionnaire list/hmm.lst 





./HTK/HTKTools/HCompV -m -T 1 -C model/config -M model/hmm_init model/hmm0/hmmF -S list/trainF.lst


./HTK/HTKTools/HCompV -m -T 1 -C model/config -M model/hmm_init model/hmm0/hmmH -S list/trainM.lst 

./HTK/HTKTools/HRest  -C model/config -T 1 -M model/hmm_train model/hmm_init/hmmF -S  list/trainF.lst

labels.mlf -M tmp -S list/trainM.lst  model/models.lst

./HTK/HTKTools/HParse model/grammaire model/dictionnaire
