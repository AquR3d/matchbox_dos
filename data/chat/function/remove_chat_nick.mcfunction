# setup uuid args
data merge storage chat:registers {args:{UUID:[]}}
data modify storage chat:registers args.UUID set from entity @s UUID
# run internal
function chat:internal/remove_chat_nick with storage chat:registers args