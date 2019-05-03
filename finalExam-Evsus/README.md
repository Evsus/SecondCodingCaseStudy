# where I stopped:
What does work is that I can remove stones from the pot and so does the computer.
It declares how many stones are left in the pot but does not check for input at any level.
Nor does it actually check the input for if you want to ask again or who should go first

# Iterative Instructions

Write and test a program that plays the ancient Chinese game of NIM. 

The user and the computer take turns removing either one or two stones from the pile. The player who takes the last stone loses. Your program should have the computer use the optimal playing strategy. The optimal strategy is as follows.

Divide the remaining number of stones by three. If the remainder is zero, then two stones are removed, otherwise one stone is removed. For example, if the remaining number of stones is nine or fifteen, then two stones are removed; if the remaining number of stones is eight or ten, then one stone is removed.

Your program should allow the user to play additional games of NIM as long as he/she enters a `y` or `yes` (lowercase or uppercase) in response to a `Do you want to play again?` prompt. See the sample session for required wording. 

Your program should perform input validation. More specifically, (1) ask the user to re-enter the number of starting stones if he/she doesn’t enter a positive number, and (2) ask the user to re-enter the number of stones to be removed if he/she doesn’t enter an appropriate number.

Sample session:
```
Welcome to NIM

Enter the number of starting stones: 7
Would you like to go first? (y/n): yEs

How many would you like to remove – 1 or 2? 1
The number of stones left is 6.

The computer removes 2 stones.
The number of stones left is 4.

How many would you like to remove – 1 or 2? 2
The number of stones left is 2.

The computer removes 1 stone.
The number of stones left is 1.

How many would you like to remove – 1 or 2? 2
You cannot remove 2 stones.

How many would you like to remove – 1 or 2? 1
The number of stones left is 0.

The computer wins!

Do you want to play again? (y/n): Y

Enter the number of starting stones: 0
You cannot start with 0 stones.

Enter the number of starting stones: 4
Would you like to go first? (y/n): n

The computer removes 1 stone.
The number of stones left is 3.

How many would you like to remove – 1 or 2? 0
You cannot remove 0 stones.

How many would you like to remove – 1 or 2? 3
You cannot remove 3 stones.

How many would you like to remove – 1 or 2? 2
The number of stones left is 1.

The computer removes 1 stone.
The number of stones left is 0.

You win!

Do you want to play again? (y/n): n
```
(Adapted from *Introduction to Programming with Java: A Problem-Solving Approach*, Dean and Dean, McGraw-Hill.)
