# change their scoreboard value
scoreboard players set @s unrevealed 0
effect clear @s glowing
# change what we should do to them about their nick
execute as @s run function mb:nametags/update_hide_nick