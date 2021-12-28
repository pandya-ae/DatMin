Dataset = read.csv('dataset2.csv')
Dataset$Purchased = factor(Dataset$Purchased,
                           levels = c(0, 1))
summary(Dataset)

library(class)
training_set <- Dataset[1:20,] # 70% training
testing_set <- Dataset[21:28,] # 30% testing
training_labels <- Dataset[1:20, 4]
testing_labels <- Dataset[21:28, 4]
View(training_set)
View(testing_set)
training_labels
testing_labels

# Feature Scaling 1 age, 2 is salary
training_set[-4] <- scale(training_set[-4])
testing_set[-4] <- scale(testing_set[-4])
training_set[-4]
testing_set[-4]

library(rpart)
library(rpart.plot)

classifier = rpart(formula = training_labels ~ .,
                   data = training_set)
plot(classifier)
text(classifier)
rpart.plot(classifier)

testing_result = predict(classifier,
                         newdata = testing_set[-5],
                         type = 'class')
testing_result
testing_labels

library(gmodels)
CrossTable(x = testing_labels,
           y = testing_result,
           prop.chisq = FALSE)

library(caret)
output <- confusionMatrix(data = testing_result,
                          reference = testing_labels)
output