# set up return value
data modify storage chat:registers return set value {value:true}
# search chat data for my uuid
$execute unless data storage chat:data chat_nicks[{UUID:$(UUID)}] run return run data merge storage chat:registers {return:{value:false}}