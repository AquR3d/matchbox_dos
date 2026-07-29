# count down running
# $tellraw @a [{"text":"{\"cmd\":\"$(cmd)\",\"id\":\"$(id)\",value:$(value)} cd running"}]
# check if value is 0, if so get rid of bossbar
$scoreboard players set $timer timer $(value)
$execute if score $timer timer matches ..0 run return run function util:time/end_timer {"cmd":"$(cmd)",id:"$(id)"}

# get data about showing timer setup
$data merge storage matchbox:timer {show_timer:$(show_timer)}
# if show timer is true, updaet this timer bossbar
$execute if data storage matchbox:timer {show_timer:1} run \
function util:time/internal/update_timer {id:"$(id)",value:$(value)}
# reset show timer value
data merge storage matchbox:timer {show_timer:false}

# decrement
scoreboard players remove $timer timer 1
# save values
execute store result storage matchbox:timer cd_tmp.value int 1.0 run \
scoreboard players get $timer timer
# reset scoreboard timer
scoreboard players set $timer timer 0
# save into data to be read
$data merge storage matchbox:timer {cd_tmp:{id:"$(id)",show_timer:$(show_timer),"cmd":"$(cmd)"}}

# additional function ality to prevent pubbiness is to rid any other timers with the same id... (wtf is "pubbiness" what did i write here??????????????)
# ... ok this is buggy i js have to tell the user USE A DIFF ID
# $data remove storage matchbox:timer timers[{id:"$(id)"}]

# add timer back into queue
function util:time/internal/timer_query with storage matchbox:timer cd_tmp
# reset cd_tmp
data merge storage matchbox:timer {cd_tmp:{value:0,id:"",show_timer:false,"cmd":"say skinidi"}}

# tellraw @a [{"nbt":"cd_tmp","storage":"matchbox:timer"},{"text":" dispatched scheduled 1s from now"}]
# schedule dispatcher
schedule function util:time/internal/count_down_dispatch 1s append