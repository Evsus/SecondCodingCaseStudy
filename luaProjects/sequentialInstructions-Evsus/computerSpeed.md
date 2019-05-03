# Computer Speed

(Adapted from *Introduction to Programming with Java: A Problem-Solving Approach*, Dean and Dean, McGraw-Hill.)

Suppose a program has on average a certain number of `statementExecutions`. A compiler translates this into object-code instructions. Since one source-code statement often translates to more than one machine-level operation, the number of object-code instructions is typically much greater than the number of source code statements. We can represent these effects with a multiplier, `instructionsPerStatement`.

A processor has a particular speed, `clockRate`. Although some instructions may require several clock cycles to complete, a modern computer often executes more than one instruction in parallel, so a given program on a given computer has an average `instructionsPerCycle` that may be either less than or greater than one. The ideal total execution time is: `statementExecutions * instructionsPerStatement / instructionsPerCycle * clockRate`.

To this ideal time, we must add whatever time it takes to fetch information not immediately available. For each successful instruction execution, we must add time to account for the chance of not finding something that’s needed. Not finding something in the first-level cache adds `(1 - firstCacheHitFraction) * firstCacheSwapTime`. 

Not finding something in the second-level cache adds `(1 - firstCacheHitFraction) * (1 - secondCacheHitFraction) * secondCacheSwapTime`. 

Not finding something in the main memory adds `(1 - firstCacheHitFraction) * (1 - secondCacheHitFraction) * (1 - mainMemoryHitFraction) * (0.5 / diskSpeed + pageSize / diskTrackLength * diskSpeed)`.

Sum the three preceding values and multiply by `statementExecutions * instructionsPerStatement` to calculate the expected increase over the ideal time.

The expected execution time is the ideal time plus the expected increase.

Write a program that estimates the total time to run a typical computer program. Make your program so that what appears on your computer screen matches the following sample session. 

Note 1: depending on your programming language, the formatting of the values in exponential notation may vary.

Note 2: be careful with the time units. Cache swap rates are entered in microseconds, but the final calculations are displayed in seconds.

Sample session:
```
Enter executions of source-code statements: 10000
Enter average instructions/statement: 20
Enter clock rate in megahertz: 2000
Enter average instructions/cycle: 1
Enter first-level cache hit fraction: 0.99
Enter first-level cache swap time in microsec: 0.001
Enter second-level cache hit fraction: 0.999
Enter second-level cache swap time in microsec: 0.005
Enter main memory hit fraction: 0.9999
Enter main memory page size in bytes/page: 4096
Enter disk speed in revolutions/sec: 500
Enter disk track length in bytes/revolution: 400000

Ideal execution time = 1.0E-4 seconds.
Expected execution time = 1.0221409599999999E-4 seconds.
```
