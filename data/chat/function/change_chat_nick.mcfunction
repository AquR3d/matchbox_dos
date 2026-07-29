# check if the player has a chat name to change...
execute as @s unless function chat:has_chat_name run return run tellraw @s [{"text":"The system believes you do not have a nicked nametag.","color":"red"}]

# setup arguments
$data merge storage chat:registers {args:{UUID:[],nick:"$(nick)"}}
data modify storage chat:registers args.UUID set from entity @s UUID
# run internal change nick
function chat:internal/change_chat_nick with storage chat:registers args
