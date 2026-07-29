# gets text and prints
# auto uuid to internal
$data modify storage chat:registers args set value {text:"$(text)",UUID:[]}
data modify storage chat:registers args.UUID set from entity @s UUID
# run internal print
function chat:internal/print with storage chat:registers args