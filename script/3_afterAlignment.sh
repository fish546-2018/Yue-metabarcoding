mkdir ./data/goodalignment
mkdir ./data/dereplicated
mkdir ./data/noSingleton

# Keep the good alignments
for f in ./data/merged/*.fastq
do
	results_file=$(basename $f .fastq)_alignment.fastq
	obigrep -p 'score>200' $f > ./data/goodalignment/$results_file
done

# Dereplicate reads
for f in ./data/goodalignment/*.fastq
do 
	results_file=$(basename $f .fastq)_uniq.fastq
	obiuniq -m sample $f > ./data/dereplicated/$results_file
done

# Remove singleton
for f in ./data/dereplicated/*.fastq
do
	results_file=$(basename $f .fastq)_nonS.fastq
	obigrep -p 'count>1' $f > ./data/noSingleton/$results_file
done
