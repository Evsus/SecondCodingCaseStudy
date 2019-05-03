lu = require('luaunit')

--declare test variables for base case expected answers
local testPierForce = 16750
local testBinBD = -17464
local testDinDF = -31032
local testAinAB = -18186
local testBinBC =  17320
local testCinCD = -14433
local testDinDE =  13279
local testAinAC =  9093
local testCinCE =  24681

--pass trussAnalysisApp variables to test
local pierForce,
tensionAtBinBD,
tensionAtDinDF,
tensionAtAinAB,
tensionAtBinBC,
tensionAtCinCD,
tensionAtDinDE,
tensionAtAinAC,
tensionAtCinCE = assert(loadfile('TrussAnalysisApp.lua'))(20000,2000,500) --[[dofile in this case wouldn't run the parameters
this is because dofile executes the script and nothing else, while loadfile holds onto the script and using it in an idiom
like this essentially makes an anonymous function and calls it immediately after creation and should discard it aftewords since
it isn't indexed in a variable]]--


--test output variables for equality to given base case
testBaseCase = {}

function testBaseCase:testPierForce()
        --pierForce = assert(loadfile('TrussAnalysisApp.lua'))(25000,1000,500)
        lu.assertEquals(pierForce, testPierForce)
        end
function testBaseCase:testTensionAtBinBD()
        lu.assertEquals(tensionAtBinBD, testBinBD)
        end
function testBaseCase:testTensionAtDinDF()
        lu.assertEquals(tensionAtDinDF, testDinDF)
        end
function testBaseCase:testTensionAtAinAB()
        lu.assertEquals(tensionAtAinAB, testAinAB)
        end
function testBaseCase:testTensionAtBinBC()
        lu.assertEquals(tensionAtBinBC, testBinBC)
        end
function testBaseCase:testTensionAtCinCD()
        lu.assertEquals(tensionAtCinCD, testCinCD)
        end
function testBaseCase:testTensionAtDinDE()
        lu.assertEquals(tensionAtDinDE, testDinDE)
        end
function testBaseCase:testTensionAtAinAC()
        lu.assertEquals(tensionAtAinAC, testAinAC)
        end
function testBaseCase:testTensionAtCinCE()
        lu.assertEquals(tensionAtCinCE, testCinCE)
        end

os.exit( lu.LuaUnit.run() )