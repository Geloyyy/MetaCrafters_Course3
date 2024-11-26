// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FencingCompetitionSimulator {

    uint public totalPoints; // Total points required to win
    uint public player1Points = 0; // Points for player 1
    uint public player2Points = 0; // Points for player 2
    bool public competitionStarted = false; // Varialble that check if competition started
    bool public isTie = false; // Flag to check if the last round was a tie

    // Function to set the total points for the competition
    function setTotalPoints(uint _totalPoints) public {
        require(_totalPoints > 0, "Points must be greater than zero.");
        totalPoints = _totalPoints;
    }

    // Function to start the competition
    function startCompetition() public {
        require(totalPoints > 0, "Set the total points first.");
        require(!competitionStarted, "Competition has already started.");

        competitionStarted = true;
    }

    // Validates the Score if it fits the required format of scores (1,1 = both score, 1,0 = player 1 scores, 0,1 = player 2 scores)
    function pointValidation(uint _value1, uint _value2) internal pure {
        if (_value1 > 1 || _value2 > 1){
            revert("Invalid Value of Points! Value of Points must ONLY contain (1,1 = both score, 1,0 = player 1 scores, 0,1 = player 2 scores) ");
        }
    }

    // Function that will handle the tie score in match point
    function tieHandling(uint _value3, uint _value4) internal {
        if (_value3 == totalPoints && _value4 == totalPoints){
            player1Points--;
            player2Points--;
            revert("Both Point Isn't counted there can only be one Winner!");
        }    
            
    }

    // Function to simulate the fencing score (1,1 = both score, 1,0 = player 1 scores, 0,1 = player 2 scores)
    function point(uint _player1Score, uint _player2Score) public {
        require(competitionStarted, "Competition has not started.");
        pointValidation(_player1Score, _player2Score);
        
        // Update the scores
        if (_player1Score == 1 && _player2Score == 0) {
            player1Points++;
        } else if (_player2Score == 1 && _player1Score == 0) {
            player2Points++;
        } else {
            player1Points++;
            player2Points++;
        }

        if (player1Points == player2Points){
            isTie = true;
        } else {
            isTie = false;
        }

        tieHandling(player1Points, player2Points);
        
        // If one player reached the total points the competition will be stopped
        if (player1Points == totalPoints || player2Points == totalPoints){
            winnerChecker();
            competitionStarted = false;
        }

    }

    // Function that will check the winner of the game
    function winnerChecker() public view returns (string memory) {

        if (player1Points == totalPoints && player2Points != totalPoints){
            return "Player 1 wins";
        } else if (player1Points != totalPoints && player2Points == totalPoints){
            return "player 2 wins";
        } else {
            return "There is still no WINNER....";
        }

    }

    // Function to reset scores after a match
    function resetScores() public {
        player1Points = 0;
        player2Points = 0;
        totalPoints = 0;
        isTie = false;
        competitionStarted = false;
        assert(!competitionStarted);
    }
}
