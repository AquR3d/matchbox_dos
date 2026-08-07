# force end game...

# clear all timers
function time:clear_all_timers

# set end state to "INNOCENT"
data modify storage mb:data game.end_state set value "INNOCENT"

# end game
function mb:gs/transitions/end_game with storage mb:data game