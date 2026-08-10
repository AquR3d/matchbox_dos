# show this specific timer to this player and other players already looking at this timer.

# this is achieved by adding the tag to the player for the bossbar w/ the id
# and re enabling the other players to show the timer.

# first check if timer exists...
$execute unless data storage timer:data timer_ids[{id:"$(id)"}] run return run \
tellraw @s {"text":"time:show_timer_to_player: No timer ID with id \"$(id)\" exists.","color":"red"}

# check if uuid already exists in players...
# setup args
$data merge storage timer:registers {args:{id:"$(id)",UUID:[]}}
data modify storage timer:registers args.UUID set from entity @s UUID
execute if function time:check_player_in_timer run return fail

# create player object with player UUID...
data modify storage timer:registers obj set value {UUID:[]}
data modify storage timer:registers obj.UUID set from entity @s UUID

# add player object onto timer with this id...
$data modify storage timer:data timer_ids[{id:"$(id)"}].players append from storage timer:registers obj

# now we update bossbar show timers...
$function time:internal/update_bossbar_players {id:"$(id)"}