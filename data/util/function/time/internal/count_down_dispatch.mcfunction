# get first timer in queue
data modify storage matchbox:timer curr_timer set from storage matchbox:timer timers[0]
# remove from queue
data remove storage matchbox:timer timers[0]

# tellraw @a [{"nbt":"curr_timer","storage":"matchbox:timer"},{"text":" dispatch running"}]
# use countdown with data
function util:time/internal/count_down with storage matchbox:timer curr_timer
# reset curr timer
data merge storage matchbox:timer {curr_timer:{show_timer:0,id:"",cmd:"",value:0}}
