# hide this specific timer from THIS player who ran the command.

# this is achieved by getting rid of the player for the bossbar w/ the id
# by removing their tag, and re enabling the other players to show the timer.

$tag @s remove timer.show_timer.$(id)

# now re enable bossbar
$bossbar set $(id) players @a[tag=timer.show_timer.$(id)]
