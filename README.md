# Yue-metabarcoding

#### Research Question: Prey partitioning between gray wolves and coyotes in different ecological contexts with varying levels of wolves and coyotes. 

This project is looking at the interaction between wolves and coyotes and how this interaction will affect the diet of wolves and coyotes in different ecological contexts, such as the high-wolf density area and high-coyote density area. The diet analyses will be done with DNA metabarcoding method using the vertebrate universal primer 12Sv5. 

#### Data used in the class

The data used in the class is from a test run of only 10 samples from multiple carnivore species, including gray wolves and coyotes. These data is used to set up the bioinformatics pipeline for large-scale projects. Over 200 samples with 6 replicates are currently processed for library preparation. 

#### Repository Structure

There are three directories in this repository and many subdirectories. Here is the structure:
- Data
  - All: raw reads including forward (R1_001.fastq) and reverse (R2_001.fastq) reads;
  - merged: after merge forward and reverse reads;
  - goodalignment: after only keep sequences with good alignment score;
  - dereplicated: after remove replicates;
  - noSingleton: after remove singletons;
  - final: same files as noSingleton, just with edited header for each sequences;
  - bastdb: store the reference database; 
  - blastOutput: store the blast results; 

- Scripts
  - 1_MergeAlignment.sh: a script to merge forward and reverse reads in each sample file;  
  - 2_AlignmentScorePlot.R: an R script to generate a histogram plot of alignment score;  
  - 3_afterAlignment.sh: a script to further filter out sequences with bad alignment score, remove replicates and singletons;  
  - 4_summaryCount.sh: a script to get a summary table of the number of remaining reads after each quality filtering step; 
  - 5_blast.sh: a script to get a taxonomy classification summary called "all_classified.fastq" stored in blastOutput folder;
  - 6_DietBar.R: an R script to generate a barchart to visualize the diet of each sample; 
  - run.sh: a macro script which contains all the above 6 scripts; 
  
 Results:
 - alignmentscore.pdf : a histogram plot of alignment score generated from 2_AlignmentScorePlot.R; 
 - file.names: a list of sample names; 
 - sum.final: a summary table of the number of remaining reads after each quality filtering step generated from 4_summaryCount.sh; 
 - relativeAbundance.pdf: a barchart to visualize the diet of each sample generated from 6_DietBar.R;
 
#### Project Timeline
 
Week 4: Set up project directory and organization;

Week 5: Quality filtering; 

Week 6: Automation for the quality filtering process; 

Week 7/8: Generate reference database; 

Week 9: taxonomy classification and final visualization; 

#### Next Steps

Apply the bioinformatics pipeline on the large-scale carnivore diet project. 
