# woah comments actually work?
tellraw @a [{"text":"+Matchbox Dos by AquR3d","color":"#119999"},{"text":" v0","color":"white"}]

# create matchbox data and registers...
execute unless data storage mb:data run data 

# game state load...
function mb:gs/internal/load