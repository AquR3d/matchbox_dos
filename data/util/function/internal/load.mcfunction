# load mcfunction
tellraw @a [{"text":"+Utility Datapack by AquR3d","color":"#888888"}]

# create data storage for arguments
execute unless data storage util:registers args run data merge storage util:registers {\
args:{\
    a:0,\
    b:0,\
    op:"",\
    lop:"",\
    value:0,\
    cmd:"",\
    spawn_locs_queue:[]}}
# create return values
execute unless data storage util:registers return run data merge storage util:registers {return:{value:0}}

# scoreboard for math
scoreboard objectives add util dummy
# add temp registers for constants
# apparently i can check if a scoreboard value of an entity existsby comparing it to itself?????????? idk
execute unless score $t0 util = $t0 util run scoreboard players set $t0 util 0
execute unless score $t1 util = $t1 util run scoreboard players set $t1 util 0
execute unless score $t2 util = $t2 util run scoreboard players set $t2 util 0
execute unless score $s0 util = $s0 util run scoreboard players set $s0 util 0
execute unless score $s1 util = $t2 util run scoreboard players set $s1 util 0
execute unless score $s2 util = $s2 util run scoreboard players set $s2 util 0
execute unless score $prev_player_count util = $prev_player_count util run scoreboard players set $prev_player_count util -1
execute unless score $player_count util = $player_count util run scoreboard players set $prev_player_count util 0