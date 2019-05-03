local hotel = {}

local TEN_PERCENT_DISCOUNT = .9

function hotel.assignFloor(room, desiredFloor, nights)
    while room == nil and desiredFloor == nil and nights == nil do

        ::room_assign::
        if room == nil then
            io.write("Please enter room size. 1 for single, 2 for double, 3 for suite: ")
                room = tonumber(io.read())
            if room < 1 or room > 3 then
                io.write("Please enter a number between 1 and 3.\n")
                room = nil
                goto room_assign
                end
            end

        ::floor_assign::
        if desiredFloor == nil then
            ::redo_assign::
            io.write("Please enter the floor between 1 through 12 you want to be on: ")
                desiredFloor = tonumber(io.read())
            if desiredFloor == 12 and room == 1 then
                io.write("There is no single on the 12th floor\n")
                goto redo_assign
                end
            if desiredFloor <= 1 and desiredFloor >= 12 then
                io.write("Please enter a number from 1 to 12.\n")
                desiredFloor = nil
                goto floor_assign
                end
            end

        ::nights_to_stay::
        if nights == nil then
            io.write("Please enter how many nights you will be staying: ")
                nights = tonumber(io.read())
            if nights < 1 then
                io.write("Must stay at least one night.\n")
                nights = nil
                goto nights_to_stay
                end
            end
        end

        --cost calculate
        local cost, total = 0 --starting point of cost and total

        if room == 1 then
            if desiredFloor < 6 then cost = 45 end
            if desiredFloor > 5 then cost = 55 end
            if desiredFloor == 12 then
                io.write("No singles on 12th floor!\n")
                cost = nil
                end
            end

        if room == 2 then
            if desiredFloor <= 5 then cost = 60 end
            if desiredFloor >= 6 then cost = 72 end
            if desiredFloor == 12 then cost = 120 end
            end

        if room == 3 then
            if desiredFloor <= 5 then cost = 130 end
            if desiredFloor >= 6 then cost = 210 end
            if desiredFloor == 12 then cost = 355 end
            end

        if cost ~= nil then
            total = cost * nights
            if nights >= 4 then total = total * TEN_PERCENT_DISCOUNT end
            end
        return cost, total, room, desiredFloor, nights
    end

return hotel