# Campaign Planning

(Adapted from *Introduction to Programming with Java: A Problem-Solving Approach*, Dean and Dean, McGraw-Hill.)

To run an effective political campaign, it’s important to plan well and use resources efficiently. You don’t waste time and money on those who probably won’t vote, will probably vote for you, or will probably vote against you. Instead, you focus on those who are likely to vote and who are currently undecided. You can start by using electronically available historical voting information to assign each potential voter to one of four “pools”:

1. members of your party who vote regularly;
2. independents who vote regularly;
3. members of your party who vote occasionally;
4. everybody else.

You gather money and support from pool 1. That supports telephone polling to qualify individual voters as “yes,” “no,” or “maybe.” You can then focus money and labor on “maybe” voters in pool 2.

Write a program to apply this strategy. Here is a sample session.

```
Political Campaign Planner

Enter number of registered voters: 5000
Enter registered voters in our party: 1500
Enter registered independent voters: 2000
Enter number of regular voters in our party
 (voting probability = 0.833): 900
Enter number of regular independent voters
 (voting probability = 0.833): 1000
Enter average number of actual voters: 2000

Enter expected fraction of our party regular votes: 1.0
Enter expected fraction of independent regular votes: 0.5
Enter expected fraction of our party occasional votes: 0.6
Enter expected fraction of other votes: 0.1

Expected votes
Pool 1. regular party votes = 749
Pool 2. regular independent votes = 416
Pool 3. occasional party votes = 48
Pool 4. other votes = 33
Total expected votes = 1246

Votes needed to win = 1001

Expected Funding
Enter number of early $500 donors: 4
Enter number of solicitation calls: 50
Amount available for campaign = $2250.0

Work Plan
Call Pool 1? [yes:1, no:0]: 1
Call Pool 2? [yes:1, no:0]: 1
Call Pool 3? [yes:1, no:0]: 0
Enter number of polling places: 2

Clerical hours = 95.0
Telephone hours = 200.0
Poll watcher hours = 20.0
Transport hours = 95.0
Overhead hours = 102.5
Total worker hours = 512.5

Enter number of workers available: 25
Hours per worker = 20.5
```
The sample session shows the inputs provided by the user. Compute the outputs as follows.

First, you should use the following named constants:

```
REGULAR_TURNOUT_FRACTION = 0.833
DOLLARS_PER_SOLICITATION = 5.00
CLERICAL_HOURS_PER_CALL = 0.05
TELEPHONE_HOURS_PER_CALL = 0.1
TRANSPORT_HOURS_PER_CALL = 0.05
OVERHEAD_FRACTION = 0.25
```


The `REGULAR_TURNOUT_FRACTION` is used for the first two pools. The turnout fraction for the remaining two pools is calculated as follows.
```
otherTurnoutFraction =
  (averageActualVoters – REGULAR_TURNOUT_FRACTION * (ourPartyRegulars + independentRegulars)) 
  /
  (totalRegistered – (ourPartyRegulars + independentRegulars))
```

Other outputs are:

1. The expected number of votes from each of the four pools. These figures are the product of three terms: the number of voters in the pool, the appropriate turnout fraction, and the expected fraction of votes for the pool. 
2. The total number of expected votes.
3. The number of votes needed to win, which is one more than half of the average actual voters.
4. The expected funding, based on the number of $500 donors, the number of solicitation calls, and the `DOLLARS_PER_SOLICITATION`. 
5. An allocation of labor. For each pool, an input of zero or one indicates whether calls will be made. Multiply these inputs by respective pool size, and sum to determine the number of polling calls to be made. Then, calculate and display the number of work hours for each of five types of work:
   1. clerical hours: computed from polling calls and `CLERICAL_HOURS_PER_CALL`
   2. telephone hours: computed from solicitation calls, polling calls, and `TELEPHONE_HOURS_PER_CALL`. Assume that solicitation calls require twice the normal number of hours.
   3. poll watcher hours: 10 hours per polling place
   4. transport hours: computed from polling calls and `TRANSPORT_HOURS_PER_CALL`
   5. overhead hours: the `OVERHEAD_FRACTION` multiplied by the sum of hours from the other four types
   6. the grand total is the sum of hours from all five types
6. Hours per worker is calculated from the grand total of hours and the input of available workers.
