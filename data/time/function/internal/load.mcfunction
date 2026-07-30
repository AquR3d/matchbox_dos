# load in necessary timer data stuff

tellraw @a {"text":"+Timers Addon by AquR3d","color":"#228888"}

# load storage for timers if not already existent.

execute unless data storage timer:data timer_ids run data merge storage timer:data {timer_ids:[]}
execute unless data storage timer:registers args run data merge storage timer:registers {args:{}}

# array for current timers that have started and for paused timers...
# this queue is the queue of timers for the recursive process of being ticked.
execute unless data storage timer:data running_timers_queue run data merge storage timer:data {running_timers_queue:[]}
execute unless data storage timer:data running_timers run data merge storage timer:data {running_timers:[]}
execute unless data storage timer:data paused_timers run data merge storage timer:data {paused_timers:[]}