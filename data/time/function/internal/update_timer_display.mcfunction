# we update the timer display of this ID with the current value in runnning_timers of this id.

$bossbar set $(id) value $(time)
# $bossbar set $(id) name "$(time)"

# setup args...
$data merge storage timer:registers {args:{id:"$(id)",minutes:0,seconds:0}}

# save time in scoreboard...
$scoreboard players set $time time.data $(time)
# set seconds to time in ticks
scoreboard players operation $seconds time.data = $time time.data
# to seconds
scoreboard players operation $seconds time.data /= $TICKS_PER_SECOND time.const
# to minutes
scoreboard players operation $minutes time.data = $seconds time.data
scoreboard players operation $minutes time.data /= $SECONDS_PER_MINUTE time.const
# remaining seconds into seconds
scoreboard players operation $seconds time.data %= $SECONDS_PER_MINUTE time.const

# save into args...
# save seconds
execute store result storage timer:registers args.seconds int 1.0 run scoreboard players get $seconds time.data
# save minutes
execute store result storage timer:registers args.minutes int 1.0 run scoreboard players get $minutes time.data

# run update with this
function time:internal/update_timer_display_name with storage timer:registers args