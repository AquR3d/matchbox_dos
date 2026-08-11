# remove from storage...

$data remove storage mb:data game.spectators[{UUID:$(UUID)}]

# add 1 to their join thing to put them back in lobby
scoreboard players add @s mb.join 1