--global vars
local lg = "Letter grade: "
local invalid = "not a valid input, try again.\n"

--main script
::redo::
io.write("Enter your numeric grade: ")
--score = tonumber(io.read())
local score = io.read("*n")
if score then
    if(0 <= score and score <= 100) then
        if 100 >= score and score >= 90 then io.write(lg, "A\n") end
        if 90  >  score and score >= 80 then io.write(lg, "B\n") end
        if 80  >  score and score >= 70 then io.write(lg, "C\n") end
        if 70  >  score and score >= 60 then io.write(lg, "D\n") end
        if 60  >  score and score >=  0 then io.write(lg, "F\n") end
    else io.write(invalid) goto redo end
else io.write(invalid) io.read("*l") goto redo end

--Thing to take away from this exercise is that io.read("*n") doesn't get rid of the input
--if it doesn't accept it as input.  Hence why this program loops if letters are the input
--so for this to work, the line buffer needs cleared *hence io.read("*l")*
