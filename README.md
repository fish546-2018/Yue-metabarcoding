# Yue-metabarcoding

#### Project Description: Impact of wolf presence on the diet of coyotes in Washington state using DNA metabarcoding technology with 12S V5 region

This project is looking at the interaction between wolf and coyotes and how this interaction will affect the diet of wolves and coyotes in the high-wolf density area and in the low-wolf density area. The diet analyses will be done with DNA metabarcoding method using 12S V5 region. 

There are three directories in this repository and many subdirectories. Here is the structure:
- Data
  - All: forward (R1_001.fastq) and reverse (R2_001.fastq) reads;
  - merged: merge forward and reverse reads;
  - goodalignment: only keep sequences with good alignment score;
  - dereplicated: remove replicates;
  - noSingleton: remove singletons;

- Scripts
  - alignment_score_histogram.R: visualize alignment scores;
  - QC.sh: shell script to filter sequences via OBItools commands;
  - summaryCount.sh: count the number of remaining sequences after each filtering step

- Analyses
  - not sure yet;

 #### Timeline

 - Week 4: directory organization and high-throughput taxonomy classification with command line;
 - Week 5: preliminary ecological analyses with test data;
