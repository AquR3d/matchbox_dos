# load in necessary timer data stuff

tellraw @a {"text":"+Timers Addon by AquR3d","color":"#228888"}

# load storage for timers if not already existent.

execute unless data storage timer:data timer_ids run data merge storage timer:data {timer_ids:[]}
execute unless data storage timer:registers args run data merge storage timer:registers {args:{}}