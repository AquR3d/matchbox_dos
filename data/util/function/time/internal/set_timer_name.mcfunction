# if seconds is less than 2 digits...
$execute if score $seconds timer matches ..9 run \
bossbar set $(id) name "$(minutes):0$(seconds)"
# if seconds is 2 digits...
$execute if score $seconds timer matches 10.. run \
bossbar set $(id) name "$(minutes):$(seconds)"

# reset scoreboard values
scoreboard players set $minutes timer 0
scoreboard players set $seconds timer 0
