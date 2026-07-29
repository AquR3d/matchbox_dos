# save their nick
execute store result storage matchbox:data vote_person.nick short 1 run scoreboard players get @s nicks
# tag them
tag @s add voted_out