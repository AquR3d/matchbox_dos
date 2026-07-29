# load function

tellraw @a [{"text":"\"NameTags Addon\" by ","color":"yellow"},{"text":"AquR3d :)","color":"aqua"}]

# note of what storage exists
# nicks:registers
# nicks:data
execute unless data storage nicks:data hidden_nicks run data merge storage nicks:data {hidden_nicks:[]}
execute unless data storage nicks:registers args run data merge storage nicks:registers {args:{}}
# make scoreboards
# keeps track of entities with nick names
scoreboard objectives add has_nick dummy
# keeps track of entities with nick names whose nicks have been hidden
scoreboard objectives add hide_nick dummy

