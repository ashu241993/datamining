housing.df <- read.csv("C:\\Users\\arjun\\Documents\\GitHub\\datamining\\BostonHousing.csv")
head(housing.df,9)
## scatter plot with axes names
plot(housing.df$medv ~ housing.df$lstat, xlab = "MDEV", ylab = "LSTAT")
# alternative plot with ggplot
library(ggplot2)
ggplot(housing.df) + geom_point(aes(x = lstat, y = medv), colour = "navy", alpha = 0.7)

## barchart of CHAS vs. mean MEDV
# compute mean MEDV per CHAS = (0, 1)
data.for.plot <- aggregate(housing.df$medv, by = list(housing.df$chas), FUN = mean)
names(data.for.plot) <- c("CHAS", "MeanMEDV")
barplot(data.for.plot$MeanMEDV, names.arg = data.for.plot$CHAS,
        xlab = "CHAS", ylab = "Avg. MEDV")
# alternative plot with ggplot
ggplot(data.for.plot) + geom_bar(aes(x = CHAS, y = MeanMEDV), stat = "identity")

## histogram of MEDV
hist(housing.df$medv, xlab = "MEDV")
# alternative plot with ggplot
ggplot(housing.df) + geom_histogram(aes(x = medv), binwidth = 5)

## boxplot of MEDV for different values of CHAS
boxplot(housing.df$medv ~ housing.df$chas, xlab = "CHAS", ylab = "MEDV")
# alternative plot with ggplot
ggplot(housing.df) + geom_boxplot(aes(x = as.factor(chas), y = medv)) + xlab("CHAS")