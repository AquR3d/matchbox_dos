# first reset score...
scoreboard players reset @s mb.join

# add exceptions...
execute unless dimension overworld run return fail
execute if entity @s[gamemode=creative] run return fail
execute if entity @s[tag=admin] run return fail

# first check if was a disconnected player... do nothing lol game state will deal with this person
execute if function mb:gm/check_player_was_disconnected run return fail

# otherwise, reset some stuff on them and tp to lobby
gamemode adventure @s
team leave @s
clear @s

# reset attributes?
attribute @s movement_speed base reset
attribute @s jump_strength base reset

# get rid of nick name and chat name
function nicks:remove_nametag
function chat:remove_chat_nick

# tp to lobby
function util:map/set_spawn_in_candidate
function util:internal/tp_to_spawns {storage:"mb:data","nbt":"map.lobby_locs"}