# load mcfunction
tellraw @a [{"text":"+Utility Datapack by AquR3d","color":"#888888"}]

# create data storage for arguments
execute unless data storage util:registers args run data merge storage util:registers {args:{}}
# create return values
execute unless data storage util:registers return run data merge storage util:registers {return:{}}

# scoreboard for math
scoreboard objectives add util dummy
# add temp registers for constants
# apparently i can check if a scoreboard value of an entity existsby comparing it to itself?????????? idk
execute unless score $t0 util = $t0 util run scoreboard players set $t0 util 0
execute unless score $t1 util = $t1 util run scoreboard players set $t1 util 0
execute unless score $t2 util = $t2 util run scoreboard players set $t2 util 0