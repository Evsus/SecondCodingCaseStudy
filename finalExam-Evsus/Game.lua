--function declarations
local function computer()
    computerTake = stones % 3
    if computerTake == 0 then
        computerTake = 2
    else computerTake = 1
    end
    
    stones = stones - computerTake
    
    io.write("The computer removes ", computerTake, " stone(s).\n")
    table.insert(playerQueue, computer)
    io.write("The number of stones left is ", stones, ".\n\n")
    if noStones() then
        io.write("You win!\n\n")
    end
end

local function human()
    io.write("How many stones would you like to remove? - 1 or 2: ")
        local playerRemove = tonumber(io.read())
        --TODO input check
        
    stones = stones - playerRemove
    
    table.insert(playerQueue, human)
    io.write("The number of stones left is ", stones, ".\n\n")
    if noStones() then
        io.write("The computer wins!\n\n")
    end
end

function noStones()
    if stones == 0 then return true
    elseif stones < 0 then
        --todo input check
    else return false
    end
end

--begin main program
io.write("Welcome to NIM\n\n")
::beginning::
playerQueue = {}

--ask player for starting input
io.write("Enter the number of starting stones: ")
    stones = tonumber(io.read())
io.write("\n")
    --input check
--Not ready for turn declaration
--io.write("Would you like to go first? (y/n): ")
    --local playerFirst = io.read()
--TODO input check 

--append first turns to playerQueue
table.insert(playerQueue, human)
table.insert(playerQueue, computer)

--iterate over player queue
for index, player in ipairs(playerQueue) do
    player()
    if noStones() then break end
end
    
--Not ready for this
--io.write("Do you want to play again? (y/n): ")
    --again = io.read()
    --input check
goto beginning