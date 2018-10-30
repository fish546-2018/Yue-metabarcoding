# Merge forward and reverse sequences
# navigate to the directory where all the raw data are stored. data/All/
outPath="/Users/yueshi/Documents/GitHub/Yue-metabarcoding/data/merged"
for R1 in *_R1_001.fastq
do
	R2="$(basename $R1 _R1_001.fastq)_R2_001.fastq"
	results_file="$(basename $R1 _R1_001.fastq)_merged.fastq"
	illuminapairedend -r $R2 $R1 > ${outPath}/$results_file
done

# Catenate merged sequences in to a single file to examine the alignment score later;
# navigate to the directory where all the merged data are scored. data/merged/
# Get alignment scores
cat *.fastq > all.merged
obistat -c score all.merged > all.merged.scores

# Keep the good alignments
# navigate to the directory where all the merged data are scored. data/merged
outPath="/Users/yueshi/Documents/GitHub/Yue-metabarcoding/data/goodalignment"
for f in *.fastq
do
	results_file=$(basename $f .fastq)_alignment.fastq
	obigrep -p 'score>200' $f > ${outPath}/$results_file
done
	

# Dereplicate reads
# navigate to the directory where all the good alignment data are scored. data/goodalignment/
outPath="/Users/yueshi/Documents/GitHub/Yue-metabarcoding/data/dereplicated"
for f in *.fastq
do 
results_file=$(basename $f .fastq)_uniq.fastq
obiuniq -m sample $f > ${outPath}/$results_file
done

# Remove singleton
# navigate to the directory where unique sequences are stored. data/dereplicated/
outPath="/Users/yueshi/Documents/GitHub/Yue-metabarcoding/data/noSingleton"
for f in *.fastq
do
results_file=$(basename $f .fastq)_nonS.fastq
obigrep -p 'count>1' $f > ${outPath}/$results_file
done