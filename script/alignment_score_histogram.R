scores <- read.table('/Users/yueshi/Documents/GitHub/Yue-metabarcoding/data/merged/all_merged.scores',h=T)
hist(rep(scores$score, scores$count), breaks=100, xlab="alignment score", main="alignement scores")
abline(v=200, col='red')
