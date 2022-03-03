my.name <- readline(prompt = "Enter name: ")
my.age <- readline(prompt = "Enter age: ")
my.mark <- readline(prompt = "Enter mark: ")
age = as.integer(my.age) + 1
print(paste("Hi,", my.name, "next year you will be", age, "years old."))
