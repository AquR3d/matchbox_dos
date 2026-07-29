# adds a nick to ur chat when using the chat book
# setup arguments
$data merge storage chat:registers {args:{UUID:[],nick:"$(nick)"}}
data modify storage chat:registers args.UUID set from entity @s UUID
# run add chat function
function chat:internal/add_chat_nick with storage chat:registers args