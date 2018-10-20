## Alignment scores
scores=read.table("N701-N508.scores",h=T)
hist(rep(scores$score, scores$count), breaks=100, xlab="alignment score", main="alignement scores")
abline(v=200, col='red')

seq_counts <- read.table('N701-N508.uniq.count', h=T)
names(seq_counts) <- c('count','seqs','reads')

nbSeqs  = sum(seq_counts$seqs)
nbReads = sum(seq_counts$reads)

plot(seq_counts[,c('count','seqs')], log='xy', main = paste(nbSeqs, "uniq sequences for", nbReads, "reads"))
