# Create a summary table sum.final to store sequence count after each step of filtering

# After merged sequences
# navigate to data/merged/
inPath="./merged"
for f in ${inPath}/*.fastq
do 
echo $(basename $f _L001_merged.fastq) >> file.names
obicount $f >> file.count
paste file.names file.count > sum.merged
done
rm file.count

# After only keeping the good alignment
inPath="./goodalignment"
for f in ${inPath}/*.fastq
do 
obicount $f >> file.count
paste sum.merged file.count > sum.goodalignment
done
rm file.count sum.merged

# After remove duplicates
inPath="./dereplicated"
for f in ${inPath}/*.fastq
do 
obicount $f >> file.count
paste sum.goodalignment file.count > sum.uniq
done
rm file.count sum.goodalignment

# After remove singleton
inPath="./noSingleton"
for f in ${inPath}/*.fastq
do 
obicount $f >> file.count
paste sum.uniq file.count > sum.final
done
rm file.count sum.uniq