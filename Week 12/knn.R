Dataset = read.csv('dataset2.csv')
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

testing_result <- knn(train = training_set, 
                      test = testing_set, 
                      cl = training_labels, 
                      k = 3)
testing_result

library(gmodels)
CrossTable(x = testing_labels,
           y = testing_result,
           prop.chisq = FALSE)

library(caret)
output <- confusionMatrix(data = testing_result,
                          reference = as.factor(testing_labels))
output