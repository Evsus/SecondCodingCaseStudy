# HVAC Load

(Adapted from *Introduction to Programming with Java: A Problem-Solving Approach*, Dean and Dean, McGraw-Hill.)

In this project you will calculate the heating and cooling loads for a typical residence. The wintertime heating load is all of the heat that flows out of the building when the outside temperature is nearly its coldest and when there is no free heat provided by sunshine or internal lights or appliances. The coldest time is typically in the middle of January. The summertime cooling load is all of the heat that flows into the building when the outside temperature is nearly its hottest, the outside humidity is high, there are no clouds to block the sun, and the building is occupied with normal lighting and appliance usage. The hottest time is usually about 3:00 PM in the middle of July.

Assume that four design parameters are constant: The winter indoor design temperature is 72 degrees F, the summer indoor design temperature is 76 degrees F, the summer indoor design humidity ratio is 0.01 pounds of water vapor per pound of dry air, and the sunshine coming in through west windows at the design time is 193 BTU/hour/square foot. (This is the "west solar heat gain" for 40 degrees North Latitude at 3:00 PM on July 21.) The remaining design parameters are user inputs: total roof area, building perimeter, building height, total area of windows and doors, total area of west-facing windows, roof U-value, wall U-value, window and door U-value, winter outdoor design temperature, summer outdoor design temperature, summer outdoor humidity ratio, infiltration rate in cubic feet per minute (CFM), number of people present, and electricity in use. (U-value is a measure of heat flow. The lower the U-value, the more slowly the material transfers heat in and out of your home.) The outputs of the program are total heating BTU/hour, total cooling BTU/hour, and the cooling load expressed in the nearest whole number of tons, where one ton = 12,000 BTU/hour. (BTU = British Thermal Unit = amount of heat required to raise one pound of water by one degree Fahrenheit.)

The heating load is the sum of the following:

- roof load: roof area * roof U-value * winter temperature difference
- window load: total window area * window U-value * winter temperature difference
- wall load:  net wall area * wall U-value * winter temperature difference
- infiltration load: CFM * 1.08 * winter temperature difference

The winter temperature difference is winter indoor design temperature – winter outdoor design temperature.

The net wall area is building perimeter * building height – window area. 

To provide a factor of safety and to accelerate morning warm up, multiply the total of all of the above heating-load components by a factor of 1.3.

 The cooling-load is the sum of the following:

- roof load: roof area * roof U-value * summer temperature difference
- window load: total window area * window U-value * summer temperature difference
- wall load: net wall area * wall U-value * summer temperature difference
- infiltration temperature load: CFM * 1.08 * summer temperature difference
- solar load: west solar heat gain * west window area
- electrical load: 3.416 * Watts
- people temperature load: 250 * number of people
- infiltration humidity load: CFM * 4675 * summer humidity difference
- people humidity load: 200 * number of people

The summer temperature difference is summer outdoor design temperature – summer indoor design temperature.

The summer humidity difference is summer outdoor humidity ratio – summer indoor humidity ratio.

To provide a factor of safety, multiply the total of all of the above cooling-load components by a factor of 1.1. 

Write a program that calculates summer and winter design loads. 

Sample session: 
```
HVAC Load Calculation

Enter total roof area in square ft: 1500
Enter building perimeter in ft: 140
Enter building height in ft: 18
Enter total window area in square ft: 400
Enter west window area in square ft: 80
Enter roof U-value: 0.04
Enter wall U-value: 0.10
Enter window U-value: 0.5
Enter summer outdoor temperature in degrees F: 100
Enter summer outdoor humidity ratio: 0.013

Enter winter outdoor temperature in degrees F: 2
Enter infiltration in CFM: 200
Enter number of people present: 3
Enter electrical use in Watts: 1500

Heating Load = 62608.0 BTU per hour
Cooling Load = 45354.1 BTU per hour or approximately 4 tons
```
