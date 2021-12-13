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

# Classification
library(class)
training_set <- Dataset[1:6,] # 60% training
testing_set <- Dataset[7:10,] # 40% testing

training_labels <- Dataset[1:6, 4]
testing_labels <- Dataset[7:10, 4]

View(training_set)
View(testing_set)

training_labels
testing_labels

# Fitting SVM to the training set
library(e1071)

classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
classifier

# Predicting the test set results
y_pred = predict(classifier, newdata = testing_set)
y_pred

library(gmodels)
CrossTable(x = testing_labels,
           y = y_pred,
           prop.chisq = FALSE)

library(caret)
output <- confusionMatrix(data = y_pred,
                          reference = testing_labels)
output