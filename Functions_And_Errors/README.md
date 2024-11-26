# FencingCompetitionSimulator Contract

The FencingCompetitionSimulator contract is a Solidity-based smart contract designed to simulate a competitive fencing match with the implementation of the use of require(), assert(), and revert() statements. These control flow statements are integral to Solidity, enabling efficient validation, error handling, and debugging in smart contracts.

## Description
This smart contract simulates a fencing match between two players. The contract allows users to set the total points required to win, validate scores, simulate scoring rounds, handle tie situations, and determine the winner. This project demonstrates essential Solidity functionality, including public variables, conditional logic, and state management.

## Features
* Set Total Points: Allows setting the number of points required to win the competition.
* Start Competition: Ensures the competition begins only after setting the total points.
* Point Validation: Validates score inputs to ensure they follow predefined rules (1,1 = both score; 1,0 = player 1 scores; 0,1 = player 2 scores).
* Handle Tie Situations: Prevents ties when both players reach the total points, ensuring there is a single winner.
* Simulate Scoring: Updates player scores based on inputs and dynamically determines whether the match continues or ends.
* Winner Declaration: Announces the winner when a player reaches the required total points.
* Reset Scores: Resets all scores and variables to prepare for a new competition.

## Getting Started

### Installing
To use this contract, follow these steps:

1. Install Remix:
* Use the Remix IDE to run this Solidity contract: Remix Ethereum IDE.

2. Set Up the Compiler:
* Use Solidity compiler version 0.8.18 in Remix.
* Compile the contract by selecting the FencingCompetitionSimulator contract.

3. Deploy the Contract:
* Deploy the contract from the Deploy & Run Transactions tab in Remix.

### Executing Program
Functions
1. Set Total Points:
```
setTotalPoints(uint _totalPoints)
```
Example: setTotalPoints(15) sets the required points to win the competition.  

2. Start Competition:
```
startCompetition()
```
Starts the competition. This function can only be called after setting the total points.  

3. Simulate Scoring:
```
point(uint _player1Score, uint _player2Score)
```
Example:
* point(1, 0) awards one point to Player 1.
* point(0, 1) awards one point to Player 2.
* point(1, 1) awards one point to both players.  

4. Check Winner:
```
winnerChecker() public view returns (string memory)
```
Returns the status of the match:
* "Player 1 wins"
* "Player 2 wins"
* "There is still no WINNER...."  

5. Reset Scores:
```
resetScores()
```
Resets all competition-related data (scores, total points, and flags) for a new match.  

## Help
1. Tie Handling: If both players reach the required total points, the last points will not count, and the match continues until there is a clear winner.
2. Competition Validation: The competition must be started before scoring can occur. Any attempt to score before starting the competition will revert the transaction.
3. State Reset: The contract must be reset manually using resetScores() before starting a new match.

## Authors
Carl Angelo L. Cruzpero  
202110959@fit.edu.ph

## License
This project is licensed under the MIT License. See the LICENSE.md file for details.
