# Two-Player Math Game Plan

## Classes

### Player
`player1, player2`

#### State
`name` -> player name

`lives` -> player lives, starts with 3

`is_alive` -> default true, becomes false when lives reach 0

#### Behaviour
`lose_life` -> subtract 1 from lives if player answered incorrectly

`lose_game` -> if lives reach 0, player loses

`user_input` -> takes user input and compares against winning answer


### Game
#### State
`current_player` -> track the current answering player

`current_score` -> track how many lives each player has

`winning_answer` -> Answer to the generate_question method

### Behaviour
`generate_question` -> return a random addition question with two numbers between 1 and 20

`game_won` -> when winning condition met, display win message


## Modules
### Helpers
A module for helper methods

`random_number` -> generate a random number between 1 and 20