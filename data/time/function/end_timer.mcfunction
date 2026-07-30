# this function will run when the timer has reached its end.
# and trigger the event associated with the timer.

# the function needs arguments so we call internal end_timer with arguments from storage.

$function time:internal/end_timer with storage timer:data timer_ids[{id:"$(id)"}]

# and then we remove the timer.
$function time:remove_timer {id:"$(id)"}