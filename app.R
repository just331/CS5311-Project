# Title     : CS5311 Project
# Created by: Justin Rodriguez, Ruonan Wu, Pavlo Vorontsov, Jingjing Mu
# Created on: 11/14/2020

dataset <- read.csv("Data/2016Q6-34-113.csv")
dataset <- dataset[2:4]

dataset$Q113 <- factor(dataset$Q113, levels = c(-1, 1))

set.seed(400)

split <- caTools::sample.split(dataset$Q113, SplitRatio = 0.75)

training_set <- subset(dataset, split == TRUE)

test_set <- subset(dataset, split == FALSE)

training_set[1:2] <- scale(training_set[1:2])

test_set[1:2] <- scale(test_set[1:2])

classifier <- e1071::svm(Q113 ~ ., data = training_set, type='C-classification', kernel='linear')

y_pred <- predict(classifier, newdata = test_set[1:2])

cm <- table(test_set[,3], y_pred)