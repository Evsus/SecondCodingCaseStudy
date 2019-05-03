--trussAnalysisApp

--read input if given by test
local a, b, c = ...



--named constants and variable declaration
local SHARED_WEIGHT_RATIO = 2
local HORIZONTAL_FORCE = 0.57735
local TENSILE_FORCE_CONSTANT = 1.1547
local centerLoad
local roadWeight
local structuralWeight

--collect values and pass input if given
if(a or b or c) then
    centerLoad = a
    roadWeight = b
    structuralWeight = c
    goto skip_user_input
end

::user_input::
--ask for and take user input
io.write("Enter center load in lbs: ")
    centerLoad = tonumber(io.read())
io.write("Enter weight of one section of road in lbs: ")
    roadWeight = tonumber(io.read())
io.write("Enter weight of structural member in lbs: ")
    structuralWeight = tonumber(io.read())

--test input
::skip_user_input::
if centerLoad == nil or roadWeight == nil or structuralWeight == nil then
    io.write("Invalid input detected, try again.\n")
    goto user_input
end

--calculate upward forces
local upForceOnEbyDE = (centerLoad / SHARED_WEIGHT_RATIO) + (roadWeight / SHARED_WEIGHT_RATIO)
local upForceOnDbyDE = -upForceOnEbyDE - structuralWeight

local upForceOnDbyCD = -upForceOnDbyDE + structuralWeight
local upForceOnCbyCD = -upForceOnDbyCD - structuralWeight
local upForceOnCbyBC = -upForceOnCbyCD + roadWeight
local upForceOnBbyBC = -upForceOnCbyBC - structuralWeight

local upForceOnBbyAB = -upForceOnBbyBC + (structuralWeight / SHARED_WEIGHT_RATIO)
local upForceOnAbyAB = -upForceOnBbyAB - structuralWeight
local pierForce = math.floor(-upForceOnAbyAB + (roadWeight / SHARED_WEIGHT_RATIO))

--calculate right forces
local rightForceOnAbyAC = -HORIZONTAL_FORCE * upForceOnAbyAB
local rightForceOnCbyAC = -rightForceOnAbyAC

local rightForceOnCbyCE = -rightForceOnCbyAC + HORIZONTAL_FORCE * (upForceOnCbyBC - upForceOnCbyCD)
local rightForceOnBbyBD = -HORIZONTAL_FORCE * (upForceOnBbyAB - upForceOnBbyBC)
local rightForceOnDbyBD = -rightForceOnBbyBD
local rightForceOnDbyDF = -rightForceOnDbyBD - HORIZONTAL_FORCE * (upForceOnDbyCD - upForceOnDbyDE)

--calculate tension
local tensionAtAinAB =  math.ceil(TENSILE_FORCE_CONSTANT * upForceOnAbyAB)
local tensionAtBinBC =  math.floor(-TENSILE_FORCE_CONSTANT * upForceOnBbyBC)

local tensionAtCinCD =  math.ceil(TENSILE_FORCE_CONSTANT * upForceOnCbyCD)
local tensionAtDinDE =  math.floor(-TENSILE_FORCE_CONSTANT * upForceOnDbyDE)
local tensionAtAinAC =  math.floor(rightForceOnAbyAC)
local tensionAtCinCE =  math.floor(rightForceOnCbyCE)

local tensionAtBinBD =  math.ceil(rightForceOnBbyBD)
local tensionAtDinDF =  math.ceil(rightForceOnDbyDF)

--return results
io.write("Support for half of bridge = ", pierForce, "lbs\n")
io.write("Total tension in BD = ", tensionAtBinBD, "lbs\n")

io.write("Total tension in DF = ", tensionAtDinDF, "lbs\n\n")
io.write("Total tension in AB = ", tensionAtAinAB, "lbs\n")
io.write("Total tension in BC = ", tensionAtBinBC, "lbs\n")
io.write("Total tension in CD = ", tensionAtCinCD, "lbs\n")

io.write("Total tension in DE = ", tensionAtDinDE, "lbs\n\n")
io.write("Total tension in AC = ", tensionAtAinAC, "lbs\n")
io.write("Total tension in CE = ", tensionAtCinCE, "lbs\n\n\n")

--pass values to caller
return      pierForce,
            tensionAtBinBD,
            tensionAtDinDF,
            tensionAtAinAB,
            tensionAtBinBC,
            tensionAtCinCD,
            tensionAtDinDE,
            tensionAtAinAC,
            tensionAtCinCE
