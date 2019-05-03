local function Factorial(number)
    if number == 1 then io.write("1\n") return 1
    else
        io.write(number, "\n")
        return number * Factorial(number - 1)
    end
end

local number = tonumber(io.read())
local answer = Factorial(number)
io.write(answer, "\n")