# see if there are still locations to be spawned to, or players, if not, no more tping
# say checking if there are locations..
execute unless entity @e[tag=tp_loc] run return fail
# say passed, now checking if there are players...
# if there are still positions but no more players to be tpd... kill all the armorstands and stop tping
execute unless entity @a[tag=spawn_in] run return run function mb:game/spawning/reset_tp_tags
# say passed
# if there is, choose random location
tag @e[type=armor_stand,sort=random,tag=tp_loc,limit=1] add tp_to_me
# say pos
# execute as @e[tag=tp_to_me] run tellraw @a [{"text":"new tp pos chosen: "},{"nbt":"Pos","entity":"@s"}]
# choose random person and tp them here
tag @a[sort=random,tag=spawn_in,limit=1] add tp_to_loc
# say random person
# execute as @a[tag=tp_to_loc] run say im being tpd and supposedly my spawn_in tag is being removed
# remove them from candidates to be tpd from to prevent them from being tpd again
tag @a[tag=tp_to_loc,limit=1] remove spawn_in
# tp them
tp @a[tag=tp_to_loc,limit=1] @e[limit=1,tag=tp_to_me]
# remove their tp to me tag
tag @a[tag=tp_to_loc] remove tp_to_loc
# kill the armorstand
# say who is being untagged
# execute as @e[tag=tp_to_me] run tellraw @a [{"text":"tp pos being removed: "},{"nbt":"Pos","entity":"@s"}]
kill @e[type=armor_stand,tag=tp_to_me,tag=tp_loc]
# go again
# say going again...
function mb:game/spawning/tp_to_spawn_recurs