# show this specific timer to this player and other players already looking at this timer.

# this is achieved by adding the tag to the player for the bossbar w/ the id
# and re enabling the other players to show the timer.

$tag @s add timer.show_timer.$(id)

# now re enable bossbar
$bossbar set $(id) players @a[tag=timer.show_timer.$(id)]
