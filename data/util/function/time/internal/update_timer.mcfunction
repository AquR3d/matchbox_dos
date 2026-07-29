# update bossbar timer name with parameters of id, and value
# get minutes and seconds
$scoreboard players set $minutes timer $(value)
$scoreboard players set $seconds timer $(value)
scoreboard players operation $minutes timer /= $seconds_per_minute timer
scoreboard players operation $seconds timer %= $seconds_per_minute timer
# store in data for use in parameters
execute store result storage matchbox:timer timer_name.minutes int 1.0 run \
scoreboard players get $minutes timer
execute store result storage matchbox:timer timer_name.seconds int 1.0 run \
scoreboard players get $seconds timer
$data merge storage matchbox:timer {timer_name:{id:"$(id)"}}

# run function with parameters
function util:time/internal/set_timer_name with storage matchbox:timer timer_name
# reset timer name
data merge storage matchbox:timer {timer_name:{id:"",minutes:0,seconds:0}}
# update bossbar value
$bossbar set $(id) value $(value)