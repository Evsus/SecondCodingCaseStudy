--conversion numbers
YEARSTODAYS = 365
YEARSTOHOURS = 8760
YEARSTOMINUTES = 525600
YEARSTOSECONDS = 31536000

--take input and calculate age formats
io.write("Enter your age in years: ")
ageYears = io.read()
ageDays = (ageYears * YEARSTODAYS) .. " days old, or\n"
ageHours = (ageYears * YEARSTOHOURS) .. " hours old, or\n"
ageMinutes = (ageYears * YEARSTOMINUTES) .. " minutes old, or\n"
ageSeconds = (ageYears * YEARSTOSECONDS) .. " seconds old.\n"

--print age formats
io.write("You are ...\n", ageDays, ageHours, ageMinutes, ageSeconds)