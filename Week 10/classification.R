# required library for data splitting
install.packages('caTools')
library(caTools)

Dataset = read.csv('Dataset.csv')
View(Dataset)

Dataset$Age = ifelse(is.na(Dataset$Age),
                     ave(Dataset$Age, 
                         FUN = function (x)mean(x, na.rm = TRUE)),
                     Dataset$Age)

Dataset$Salary = ifelse(is.na(Dataset$Salary),
                        ave(Dataset$Salary, 
                            FUN = function (x)mean(x, na.rm = TRUE)),
                        Dataset$Salary)

Dataset$Country = factor(Dataset$Country, 
                         levels = c('France','Spain','Germany'), 
                         labels = c(1.0, 2.0 , 3.0 ))

Dataset$Purchased = factor(Dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))
Dataset$Purchased[is.na(Dataset$Purchased)] <- 0
as.factor(Dataset$Purchased)

#set.seed(123)
#split = sample.split(Dataset$Purchased, SplitRatio = 0.8) # returns true if observation goes to the Training set and false if observation goes to the test set.

#Creating the training set and test set separately
#training_set = subset(Dataset, split == TRUE)
#test_set = subset(Dataset, split == FALSE)
#training_set
#test_set

#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])
#training_set
#test_set

# Classification
install.packages('class')
library(class)
training_set <- Dataset[1:6,] # 60% training
testing_set <- Dataset[7:10,] # 40% testing
training_labels <- Dataset[1:6, 4]
testing_labels <- Dataset[7:10, 4]
View(training_set)
View(testing_set)
training_labels
testing_labels
# k = 1
testing_result <- knn(train = training_set, 
                      test = testing_set, 
                      cl = training_labels, 
                      k = 1)
testing_result

# k = 3
testing_result_k3 <- knn(train = training_set, 
                      test = testing_set, 
                      cl = training_labels, 
                      k = 3)
testing_result_k3

install.packages('gmodels')
library(gmodels)
# k = 1
CrossTable(x = testing_labels,
           y = testing_result,
           prop.chisq = FALSE)

# k = 3
CrossTable(x = testing_labels,
           y = testing_result_k3,
           prop.chisq = FALSE)

install.packages('caret')
library(caret)
output <- confusionMatrix(data = testing_result,
                          reference = testing_labels)
output