# create game state storage nbt data

# SHOULD NOT MODIFY the current game state...
execute unless data storage mb:data game.current_game_state_tick_function run data merge storage mb:data {game:{current_game_state_tick_function:""}}

# all the different game states...
#   0 transition (T)
#   1 in_game_paused (IGP)
#   2 pre_game (PG)
#   3 in_map (IM)
#   4 in_discussion (ID)
#   5 in_voting (IV)