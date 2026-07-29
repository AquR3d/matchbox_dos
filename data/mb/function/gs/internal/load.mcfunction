# create game state storage nbt data

# SHOULD NOT MODIFY the current game state...
execute unless data storage matchbox:data current_game_state_tick_function run data merge storage matchbox:data {current_game_state_tick_function:""}

# all the different game states...
#   transition (T)
#   in_game_paused (IGP)
#   pre_game (PG)
#   in_map (IM)
#   in_discussion (ID)
#   in_voting (IV)