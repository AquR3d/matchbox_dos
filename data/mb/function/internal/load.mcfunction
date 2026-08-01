# woah comments actually work?
tellraw @a [{"text":"+Matchbox Dos by AquR3d","color":"red"},{"text":" v0","color":"white"}]

# create matchbox data and registers...

# these arrays will help determine who is playing and easily keep track of them in a list, as well as the disconnected players.
execute unless data storage mb:data game{} run \
data merge storage mb:data {game:{current_players:[],disconnected_players:[],current_game_state:{}}}
execute unless data storage mb:registers args run data merge storage mb:registers {args:{},current_players_queue:[]}

# game state load...
function mb:gs/internal/load