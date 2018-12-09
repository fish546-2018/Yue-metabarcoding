# Create a summary table sum.final to store sequence count after each step of filtering

# After merged sequences
for f in ./data/merged/*.fastq
do 
echo $(basename $f _L001_merged.fastq) >> file.names
obicount $f >> file.count
paste file.names file.count > sum.merged
done
rm file.count

# After only keeping the good alignment
for f in ./data/goodalignment/*.fastq
do 
obicount $f >> file.count
paste sum.merged file.count > sum.goodalignment
done
rm file.count sum.merged

# After remove duplicates
for f in ./data/dereplicated/*.fastq
do 
obicount $f >> file.count
paste sum.goodalignment file.count > sum.uniq
done
rm file.count sum.goodalignment

# After remove singleton
for f in ./data/noSingleton/*.fastq
do 
obicount $f >> file.count
paste sum.uniq file.count > sum.final
done
rm file.count sum.uniq