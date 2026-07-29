# this will remove a timer by id...

# check if it exists...

$execute unless data storage timer:data timer_ids[{id:"$(id)"}] run return run tellraw @s {"text":"time:remove_timer: There was no timer to delete.","color":"red"}

# otherwise delete from storage...

$data remove storage timer:data timer_ids[{id:"$(id)"}]

# and remove bossbar.

$bossbar remove $(id)