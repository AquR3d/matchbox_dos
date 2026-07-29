# for each nick... do nametag teleport stuff
scoreboard players set $tp_iter nametags 0
function mb:nametags/tp_nametag_recurs
scoreboard players set $tp_iter nametags -1
