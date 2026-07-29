# force hide all
# set scoreboard values
scoreboard players set @a[team=sigmas,scores={nicks=0..}] hide_nick 1
# kill name tags
scoreboard players set $iterator nametags 0
function mb:nametags/kill_nametag
scoreboard players set $iterator nametags 0
