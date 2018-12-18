#download the stand-alone BLAST from
#ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/
#to /Users/yueshi/Documents/Wolf-DNA-metabarcoding/BLAST+
#tar zxvpf ncbi-blast+2.7.1-x64-linux.tar.gz
export PATH=$PATH:$HOME/Documents/Wolf-DNA-metabarcoding/BLAST+/ncbi-blast-2.7.1+/bin
echo $PATH
blastn -h

#Make database
makeblastdb \
-in ./data/blastdb/reference.fasta \
-dbtype nucl \
-out ./data/blastdb/ref

#Create a new directory called "final"
#Copy noSingle into final'
#Edit fasta headers in final folder; 
cp -r ./data/noSingleton/ ./data/final/
for f in ./data/final/*.fastq
do
sampleID=$(basename $f _L001_merged_alignment_uniq_nonS.fastq)
sed -i '' "s/>/>${sampleID}_/g" $f
sed -i '' 's/CONS count/CONS_count/g' $f
done

#Blast multiple files
#Create a new directory to store blast results;
mkdir ./data/blastOutput
for f in ./data/final/*.fastq
do
results_file=$(basename $f .fastq)_taxonomy.fastq
blastn \
-query $f \
-db ./data/blastdb/ref \
-out ./data/blastOutput/$results_file \
-evalue 1E-20 \
-perc_identity 100 \
-num_threads 4 \
-max_target_seqs 1 \
-max_hsps 1 \
-outfmt "6 qseqid sseqid pident qlen length mismatch evalue"
done

#Merge all files in blastOutput folder
cat ./data/blastOutput/*.fastq > ./data/blastOutput/all_classified.fastq

#Reorganize the all_classified.fastq to make it cleaner
#The order of columns are
#TaqCombo,SampleID,SeqCount,Species,PercentMatch,AmpliconLength,ReferenceLength,Mismatch,Evalue
sed -i '' 's/_M.*_count/ count/g; s/_S/ S/g; s/;//g; s/count=//g' ./data/blastOutput/all_classified.fastq






