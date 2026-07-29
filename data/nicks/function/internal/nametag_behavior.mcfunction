#$say testing $(UUID)

# this function assumes the owner is alive...
# if their nametag is not in the world nor in data... dont say they have a nametag and stop doing behavior
$execute unless entity @e[type=text_display,nbt={Tags:["$(UUID)","nametag"]}] \
unless data storage nicks:data hidden_nicks[{UUID:$(UUID)}] \
run return run scoreboard players set @s has_nick 0

#$say passed $(UUID)
# now preconditions met

# if nametag is in data and hidden, do nothing and return
$execute if score @s hide_nick matches 1 if data storage nicks:data hidden_nicks[{UUID:$(UUID)}] run return fail
# if nametag is in data and their nick is not hidden, return and summon nametag
$execute if score @s hide_nick matches 0 if data storage nicks:data hidden_nicks[{UUID:$(UUID)}] \
run return run function nicks:internal/summon_nametag with storage nicks:data hidden_nicks[{UUID:$(UUID)}]

# if nametag in the world and nametag is hidden, return and store nametag in data
$execute if score @s hide_nick matches 1 as @e[type=text_display,nbt={Tags:["$(UUID)","nametag"]}] run return run function nicks:internal/store_nametag with entity @s
# if nametag in the world and nametag is unhidden, tp
$execute if score @s hide_nick matches 0 at @s anchored eyes positioned ^ ^ ^ positioned ~ ~.4 ~ run tp @e[type=text_display,nbt={Tags:["$(UUID)","nametag"]}] ~ ~ ~
# if crouched and nametag display is not lower opacity, make it
$execute if predicate nicks:is_sneaking as @e[type=text_display,nbt={Tags:["$(UUID)","nametag"]}] unless data entity @s {text_opacity:40b} run \
data modify entity @s text_opacity set value 40b
# if uncrouched and nametag displat is not normal opacity, make it
$execute unless predicate nicks:is_sneaking as @e[type=text_display,nbt={Tags:["$(UUID)","nametag"]}] unless data entity @s {text_opacity:-1b} run \
data modify entity @s text_opacity set value -1b