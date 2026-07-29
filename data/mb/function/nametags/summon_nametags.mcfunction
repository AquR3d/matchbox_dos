# summon text displays if they dont exist already
# say ran
scoreboard players set $iterator nametags -1
function mb:nametags/summon_nametag_recurs
# reset iterator
scoreboard players set $iterator nametags -1