--take input and calculate GPA
io.write("Enter the number of quality points earned: \n")
qualityPoints = io.read()
io.write("Enter the number of credit hours earned: \n")
creditHours = io.read()
GPA = qualityPoints / creditHours
io.write("The grade point average is ", GPA, "\n")