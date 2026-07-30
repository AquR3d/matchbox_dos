# this is the recursive function for timer behavior that takes in the queue of running timers...
# will be ran by the time:tick function...

# first we check if the queue is empty, if so, we stop the recursive process.
execute unless data storage timer:data running_timers_queue[] run return fail

# otherwise, we run timer behavior on the first one in the queue and pop off the queue.
function time:internal/timer_behavior with storage timer:data running_timers_queue[0]

# pop off the queue
data remove storage timer:data running_timers_queue[0]

# recursively call again for the next timer in queue.
function time:internal/timer_behavior_recurs