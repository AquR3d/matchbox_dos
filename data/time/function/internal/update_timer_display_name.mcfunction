# this changes the bossbar name to minutes and seconds...

# we check if seconds is less than 10 seconds...
$execute if score $9 time.const matches $(seconds).. run return run \
bossbar set $(id) name "$(minutes):0$(seconds)"

# otherwise print normally
$bossbar set $(id) name "$(minutes):$(seconds)"