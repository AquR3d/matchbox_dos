# woah comments actually work?
tellraw @a [{"text":"+Matchbox Dos by AquR3d","color":"red"},{"text":" v0","color":"white"}]

# create matchbox data and registers...

# these arrays will help determine who is playing and easily keep track of them in a list, as well as the disconnected players.
execute unless data storage mb:data game{} run \
data merge storage mb:data \
{game:{\
    current_players:[],\
    disconnected_players:[],\
    current_game_state:{},\
    current_game_state_tick_function:"",\
    name_pool:[]\
    }}
execute unless data storage mb:registers args run data merge storage mb:registers \
{args:{},\
current_players_queue:[],\
name_pool_queue:[]}

# create matchbox scoreboard... idk
scoreboard objectives add mb.data dummy
scoreboard players set $prev_player_count mb.data -1
scoreboard players set $player_count mb.data 0
# for detecting player dc...

# make team... for visibility ig
team add mb.sigmas
team modify mb.sigmas nametagVisibility never
team modify mb.sigmas friendlyFire false
team modify mb.sigmas deathMessageVisibility never