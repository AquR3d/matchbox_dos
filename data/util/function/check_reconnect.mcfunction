# get the current player count...
execute store result score $player_count util if entity @a

# compare with prev count... if current player count is greater than previous player count... set previous player count and store true...
execute store result score $t0 util if score $player_count util > $prev_player_count util

# set prev player count must be run AFTER checking both disconnect and reconnect.

# return $t0
return run execute if score $t0 util matches 1..

