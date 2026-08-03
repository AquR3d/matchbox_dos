# change game state to "PRE_GAME", and add tick function...

data modify storage mb:data game.current_game_state set value "PRE_GAME"
data modify storage mb:data game.current_game_state_tick_function set value "function mb:gs/tick/pre_game"