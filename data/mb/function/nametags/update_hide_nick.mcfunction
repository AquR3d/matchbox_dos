# do scoreboard math to make or gate of r we showing and if this player is already revealed
# designed to be run after execute as @a run ...
scoreboard players operation @s hide_nick = @s unrevealed
scoreboard players operation @s hide_nick *= $dont_show_all hide_nick

# additional functionality, kill any text displays for people whose hide nicks is true
scoreboard players set $iterator nametags 0
function mb:nametags/kill_nametag
scoreboard players set $iterator nametags 0

# summon new ones
function mb:nametags/summon_nametags