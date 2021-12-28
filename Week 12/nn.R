# Neural Network
library(neuralnet)

Dataset = read.csv('dataset2.csv')
summary(Dataset)
View(Dataset)

library(class)
training_set <- Dataset[1:20,] # 70% training
testing_set <- Dataset[21:28,] # 30% testing
training_labels <- Dataset[1:20, 4]
testing_labels <- Dataset[21:28, 4]
View(training_set)
View(testing_set)
training_labels
testing_labels

# Neural Network
nn <- neuralnet(Purchased ~ Country + Age + Salary,
                data = training_set,
                hidden = c(2, 1),
                linear.output = FALSE,
                threshold = 0.01)
nn$result.matrix
plot(nn)

# Test the resulting output
temp_test <- subset(testing_set,
                    select = c('Country', 'Age', 'Salary'))
head(temp_test)

output <- compute(nn, temp_test)
output

testing_result <- sapply(output$net, 
                         round,
                         digits = 0)
testing_result

library(gmodels)
CrossTable(x = testing_labels,
           y = testing_result,
           prop.chisq = FALSE)

library(caret)
output <- confusionMatrix(data = testing_result,
                          reference = as.factor(testing_labels))
output