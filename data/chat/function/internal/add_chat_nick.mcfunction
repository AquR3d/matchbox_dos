# if uuid already exists, run change nick instead
$execute if data storage chat:data chat_nicks[{UUID:$(UUID)}] run return run function chat:internal/change_chat_nick {UUID:$(UUID),nick:"$(nick)"}
# append to array if does not exist
$data modify storage chat:data chat_nicks append value {UUID:$(UUID),nick:"$(nick)"}
