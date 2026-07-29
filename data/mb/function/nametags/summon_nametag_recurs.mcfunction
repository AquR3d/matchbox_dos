# summon nametag
# increment iterator
scoreboard players add $iterator nametags 1
# if we reached max, exit
execute if score $iterator nametags >= $max nicks run return fail
# if this nametag exists, don't summon and move onto next
execute as @e[type=text_display,scores={nametags=0..}] if score @s nametags = $iterator nametags run return run function mb:nametags/summon_nametag_recurs
# if this player is hidden, also dont summon the nametag
execute as @a[scores={hide_nick=1}] if score @s nicks = $iterator nametags run return run function mb:nametags/summon_nametag_recurs
# summon nametag
execute as @a[scores={hide_nick=0}] if score @s nicks = $iterator nametags run \
summon minecraft:text_display ~ ~2.0625 ~ {alignment:"center",billboard:"center",see_through:0b,Tags:["nametag"],text:'{"text":"blank","color":"#CC9EFA"}'}
# set score to iterator score
scoreboard players operation @e[type=text_display,tag=nametag] nametags = $iterator nametags
# update nametag text
function mb:nametags/update_nametags
# reset tag
tag @e[tag=nametag] remove nametag
# run the function again
function mb:nametags/summon_nametag_recurs