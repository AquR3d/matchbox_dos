# this recursive function will iterate through the timer_ids storage in timer:data and just delete the bossbars associated
# with said ids, and from the storage.

# we first check our base case, if there is anything in the array timer_ids...

# if nothing. return.
execute unless data storage timer:data timer_ids[] run return fail

# otherwise get first timer in the queue and remove.
function time:remove_timer with storage timer:data timer_ids[0]

# recall the function.
function time:clear_all_timers