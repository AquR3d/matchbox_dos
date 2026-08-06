# get my_vote of this player...

# and check if this person who they voted for exist... if not skip vote and return
$execute unless data storage mb:data game.current_players[{nick:"$(my_vote)"}] run \
scoreboard players add $skip_vote mb.data 1

$execute unless data storage mb:data game.current_players[{nick:"$(my_vote)"}] run return run \
tellraw @a {"text":"mb:gm/internal/tally_my_vote: \"$(nick)\" was detected as attempted to vote but found that the nick who this player voted for was not valid. \
Making them skip vote.","color":"red"}

# otherwise... accumulate this nick's votes...
# setup args...
data merge storage util:registers {args:{a:0,b:1,op:"+="}}

# set a parameter to votes of the nick...
$data modify storage util:registers args.a set from storage mb:data game.current_players[{nick:"$(my_vote)"}].votes

# perform math
function util:math/scoreboard_operation

# get the return value back into votes...
$data modify storage mb:data game.current_players[{nick:"$(my_vote)"}].votes set from storage util:registers return.value