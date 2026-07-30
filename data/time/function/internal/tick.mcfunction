# we first check if there are any timers that are running, bc if not we dont do anythin
execute unless data storage timer:data running_timers[] run return fail

# otherwise, ther are timers we need to run timer behavior on...
# we create a timer queue that is a copy of the running timers...

data modify storage timer:data running_timers_queue set from storage timer:data running_timers

# now that we have the queue, we run timer behavior recursively on the queue
function time:internal/timer_behavior_recurs
