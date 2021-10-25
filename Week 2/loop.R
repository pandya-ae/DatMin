for (i in 1:10) {
  x1 <- i * 3 + 1
  print(x1)
}

x2 <- c("Max", "Tina", "Lindsey", "Anton", "Sharon")
for (i in x2) {
  print(paste("The name", i, "consists of", nchar(i), "characters."))
}

x3 <- numeric()
for (i in 1:10) {
  x3 <- c(x3, i ^ 2)
  print(x3)
}

x4 <- character()
for (i in 1:3) {
  for(j in 1:2) {
    x4 <- c(x4, paste(LETTERS[i], letters[j], sep = "_"))
  }
}
print(x4)

for (i in 1:10) {
  if(i %in% c(1, 5, 7)) {
    next
  }
  x6 <- i ^ 2
  print(x6)
}