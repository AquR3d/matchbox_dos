# if uuid already exists, tell user it already exists and do nothing.
$execute if data storage chat:data chat_nicks[{UUID:$(UUID)}] run return run \
tellraw @s {"text":"chat:internal/add_chat_nick: There already exists a chat nickname for your UUID!  Try using the change_chat_nick function instead!","color":"red"}
# append to array if does not exist
$data modify storage chat:data chat_nicks append value {UUID:$(UUID),nick:"$(nick)"}
