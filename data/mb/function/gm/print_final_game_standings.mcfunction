# this function will print the final game standings...

tellraw @a {"text":"FINAL PLAYER STANDINGS:"}

# as every player... print survive
# create queue
data modify storage mb:registers current_players_queue set from storage mb:data game.current_players

# call
function mb:gm/internal/print_survived_players

# as every player... print survive
# create queue
data modify storage mb:registers current_players_queue set from storage mb:data game.deceased_players

# call
function mb:gm/internal/print_deceased_players