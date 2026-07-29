# if someone whose nick is to be hidden matches the iterator, and theres a text display that matches the iterator, kill that text display
execute as @a[team=sigmas,scores={hide_nick=1}] if score @s nicks = $iterator nametags as @e[type=text_display,scores={nametags=0..}] if score @s nametags = $iterator nametags run kill @s
# if a text display exists but its player doesnt...
scoreboard players set $tag_exists nametags 0
execute as @e[type=text_display,scores={nametags=0..}] if score @s nametags = $iterator nametags as @a[scores={hide_nick=1}] \
if score @s nicks = $iterator nametags run scoreboard players set $tag_exists nametags 1
execute if score $tag_exists nametags matches 0 as @e[type=text_display,scores={nametags=0..}] if score @s nametags = $iterator nametags run kill @s
scoreboard players set $tag_exists nametags 0
# increase iterator and go next
scoreboard players add $iterator nametags 1
# if reached max, no more recursion
execute if score $iterator nametags >= $max nicks run return fail
function mb:nametags/kill_nametag