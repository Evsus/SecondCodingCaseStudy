<p style="color:black">

# Conditional Instructions

This formal programming assignment emphasizes conditional instructions.

Before you start, please search [this repository](https://github.com/github/gitignore) for a file that is appropriate to your programming language. Copy the contents of the file and save them in this folder as a file named `.gitignore`. This will configure git to ignore temporary files that are typically created by your PL's tools. If you find that git is tracking other unnecessary files (like backups made by editors), you might look in the repository's `Global` folder for more configuration lines to add to your `.gitignore`. 

## Hotel Charges

(Adapted from *Object-Oriented Programming Using C++*, Farrell, Thomson.) 

The Carlington Hotel wants a program in which the user enters the type of room that a guest wants (1 for single, 2 for double, 3 for suite), the floor desired (1 through 12), and the number of nights the guest will stay. 

Compute the nightly rate from the following table, multiply by the number of nights, and then provide a 10% discount on the total if the guest stays 4 or more nights.

|               | Single        | Double | Suite  |
| ------------- | ------------- | ------ | ------ |
| Floors 1 - 5  | 45.00         | 60.00  | 130.00 |
| Floors 6 - 11 | 55.00         | 72.00  | 210.00 |
| Floor 12      | Not available | 120.00 | 355.00 |

Display the nightly price and the total price for the stay, or display an error message if a combination is not available or if an invalid room type or floor is entered. 

Sample session: 
```
Enter room type: 2
Enter desired floor: 11
How many nights? 3
Double rate on floor 11 is $72.00 nightly, for a total of $216.00
```
Another sample session:
```
Enter room type: 3
Enter desired floor: 5
How many nights? 4
Suite rate on floor 5 is $130.00 nightly, for a total of $468.00
```
Your work on this program will be evaluated using the software construction rubric. Implementing this logic in a well-organized way takes some time and thought; first attempts will likely need refinements. It is possible to implement this logic with as few as 10 decision branches (not counting data validation tests).
</p>