# this function goes from the in voting and checks if we should end the game...

# check if we have to vote someone off... if so, check game state after
function mb:gm/voting/check_decease_voted_player

# check end game
function mb:gm/check_end_game_decision

# if not continue, end the game...
execute unless data storage mb:data {game:{end_state:"CONTINUE"}} run return run \
function mb:gs/transitions/end_game with storage mb:data game

# say transitioning from iv to im...

# if it is continue, we transition to in map...
function mb:gs/transitions/iv_to_im