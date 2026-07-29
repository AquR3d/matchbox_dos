# see if nametag exists and change that
$execute if entity @e[type=text_display,nbt={Tags:["$(UUID)","nametag"]}] run return run \
execute as @e[type=text_display,nbt={Tags:["$(UUID)","nametag"]}] run data modify entity @s text set value '$(value)'
# if nametag in data, change that
$execute if data storage nicks:data hidden_nicks[{UUID:$(UUID)}] run return run data modify storage nicks:data hidden_nicks[{UUID:$(UUID)}].nick set value "$(value)"
# else, it doesn't exist and something went wrong
tellraw @s [{"text":"The system could not find your nicked nametag in data nor in the world, so nothing happened.","color":"red"}]
# debating whether we should make it to where we change their scoreboard to not have a nick... not really necessary though