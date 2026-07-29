# idk a comment, find the current iter whatever
execute as @a[team=sigmas,scores={hide_nick=0,nicks=0..}] if score @s nicks = $tp_iter nametags at @s run function mb:nametags/choose_crouching_nametag
# increment it and do it AGAIN
scoreboard players add $tp_iter nametags 1
execute if score $tp_iter nametags >= $max nicks run return fail
function mb:nametags/tp_nametag_recurs