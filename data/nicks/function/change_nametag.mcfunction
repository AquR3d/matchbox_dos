# only run if person has a nametag
execute unless score @s has_nick matches 1 run return run tellraw @s [{"text":"The system believes you do not have a nicked nametag.","color":"red"}]
# run internal change nametag with uuid
$data modify storage nicks:registers args set value {value:"$(nick)",UUID:[]}
data modify storage nicks:registers args.UUID set from entity @s UUID
function nicks:internal/change_nametag with storage nicks:registers args