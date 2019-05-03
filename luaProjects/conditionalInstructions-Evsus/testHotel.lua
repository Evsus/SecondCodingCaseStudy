local test = require('luaunit')
local hotel = require('Hotel')

local singleOne_Five = 45
local doubleOne_Five = 60
local suiteOne_Five = 130
local singleSix_Eleven = 55
local doubleSix_Eleven = 72
local suiteSix_Eleven = 210
local single_Twelve = nil
local double_Twelve = 120
local suite_Twelve = 355

testAssignRoom = {}
function testAssignRoom:testSingle()
    local resultOne_Five    = hotel.assignFloor(1, 1, 1)
        test.assertIs(resultOne_Five, singleOne_Five)
    local resultSix_Eleven  = hotel.assignFloor(1, 6, 1)
        test.assertIs(resultSix_Eleven, singleSix_Eleven)
    local result_Twelve     = hotel.assignFloor(1, 12, 1)
        test.assertIs(result_Twelve, single_Twelve)
    end
function testAssignRoom:testDouble()
    local resultOne_Five    = hotel.assignFloor(2, 1, 1)
        test.assertIs(resultOne_Five, doubleOne_Five)
    local resultSix_Eleven  = hotel.assignFloor(2, 6, 1)
        test.assertIs(resultSix_Eleven, doubleSix_Eleven)
    local result_Twelve     = hotel.assignFloor(2, 12, 1)
        test.assertIs(result_Twelve, double_Twelve)
    end
function testAssignRoom:testSuite()
    local resultOne_Five    = hotel.assignFloor(3, 1, 1)
        test.assertIs(resultOne_Five, suiteOne_Five)
    local resultSix_Eleven  = hotel.assignFloor(3, 6, 1)
        test.assertIs(resultSix_Eleven, suiteSix_Eleven)
    local result_Twelve     = hotel.assignFloor(3, 12, 1)
        test.assertIs(result_Twelve, suite_Twelve)
    end
os.exit( test.LuaUnit.run() )