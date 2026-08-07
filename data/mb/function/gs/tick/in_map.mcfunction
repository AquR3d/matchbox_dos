# in map tick function...

title @a actionbar {"text":"in map"}

# give weakness to prevent fighting
execute as @a if function mb:gm/check_player_in_game run effect give @s weakness 1 255 true

# check crossbow use...
execute as @a if function mb:gm/check_player_in_game unless function mb:gm/get_player_used_arrow_data \
if score @s mb.crossbow matches 1.. run function mb:gm/set_used_arrow {value:true}

# prevent matchbox arrows from being picked up...
# execute in overworld as @e[type=spectral_arrow,nbt={item:{components:{"minecraft:custom_data":{mb.tag:true}}},pickup:1b}] run data modify entity @s pickup set value 0b

# kill any matchbox arrows on the ground...
# execute in overworld as @e[type=spectral_arrow,nbt={item:{components:{"minecraft:custom_data":{mb.tag:true}}},pickup:0b,inGround:1b}] run kill @s

# also change any dropped signs to custom signs...
function mb:gu/items/dropped_sign_change

# detect if revealed...
execute as @a if function mb:gm/check_player_in_game if data entity @s {active_effects:[{id:"minecraft:glowing"}]} run \
function mb:gm/reveal_player with entity @s

# testing out dc check...
execute if function mb:gm/check_for_player_disconnect run function mb:gs/transitions/pause_game