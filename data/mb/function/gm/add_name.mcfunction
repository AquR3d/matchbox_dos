# adding name to name pool...

# first check if name already exists...
$execute if data storage mb:data {game:{name_pool:["$(name)"]}} run return run \
tellraw @s {"text":"mb:gm/add_name: This name already exists in the name pool! Try a different name.","color":"red"}

$data modify storage mb:data game.name_pool append value "$(name)"