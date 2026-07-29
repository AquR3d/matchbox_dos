# change nick, if it doesn't exist, stop
$execute unless data storage chat:data chat_nicks[{UUID:$(UUID)}] run return run \
tellraw @s [{"text":"You have not been assigned a chat nick, so nothing happened.","color":"red"}]
# change nick
$data modify storage chat:data chat_nicks[{UUID:$(UUID)}].nick set value "$(nick)"