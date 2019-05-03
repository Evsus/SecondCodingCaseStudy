--script to properly call Hotel.lua and declares variables used here
local hotel = require('Hotel')
local room, desiredFloor, nights, cost, total, word

--if anything is passed when script is called
room, desiredFloor, nights = ...

--receive returned input from parent script
cost, total, room, desiredFloor, nights = hotel.assignFloor(room, desiredFloor, nights)

--turn room type number into related string
local function roomToWord(requested)
    if requested == 1 then word = "Single" end
    if requested == 2 then word = "Double" end
    if requested == 3 then word = "Suite" end
    return word
    end

--print output
io.write(string.format("%s rate on floor %d is $%d nightly, for a total of $%d for %d nights.\n",
            roomToWord(room), desiredFloor, cost, total, nights))
