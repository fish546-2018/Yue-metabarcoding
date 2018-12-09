# Merge forward and reverse sequences

mkdir ./data/merged
cd ./data/All

for R1 in *_R1_001.fastq
do
	R2="$(basename $R1 _R1_001.fastq)_R2_001.fastq"
	results_file="$(basename $R1 _R1_001.fastq)_merged.fastq"
	illuminapairedend -r $R2 $R1 > ../merged/$results_file
done

# Catenate merged sequences in to a single file to examine the alignment score later;
# Get alignment scores
cat ../merged/*.fastq > ../merged/all.merged
obistat -c score ../merged/all.merged > ../merged/all.merged.scores