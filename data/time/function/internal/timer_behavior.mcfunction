# this is the timer behavior logic for a single timer...

# if the timer has reached 0 or less, we end the timer.

# run comparison function, but first pass in arguments to see if a <= b (if time is <= 0...)
$data modify storage util:registers args set value {a:$(time),b:0,lop:"<="}

# if the return value is true... we end the timer and return.
$execute if function util:logic/scoreboard_logic run return run function time:end_timer {id:"$(id)"}

# otherwise... we're here so the timer is definitely greater than 0, we countdown, decrement the value, and update the timer display.
$execute store result storage timer:data running_timers[{id:"$(id)"}].time int 1.0 \
run function util:internal/scoreboard_operation {a:$(time),b:1,op:"-="}

# update timer display with this new value/ current updated running timer data
$function time:internal/update_timer_display with storage timer:data running_timers[{id:"$(id)"}]