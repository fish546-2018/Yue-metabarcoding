bash ./script/1_MergeAlignment.sh
Rscript ./script/2_AlignmentScorePlot.R 
bash ./script/3_afterAlignment.sh
bash ./script/4_summaryCount.sh 
bash ./script/5_blast.sh 
Rscript ./script/6_DietBar.R