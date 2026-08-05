# tp marked person to discussion room
function mb:game/spawning/tp_to_storage with storage matchbox:data spec_discussion_pos
# make their team into team betas (spectator)
team join betas @s
# clear their inventory
clear @s
# make them a spectator
gamemode spectator @s
# make them not alive (for voting)
scoreboard players set @s alive 0
# tell them they died lol
tellraw @s [{"text":"You were secretly marked by the spark during the round, and have died.\
\nYou can now spectate the game."}]