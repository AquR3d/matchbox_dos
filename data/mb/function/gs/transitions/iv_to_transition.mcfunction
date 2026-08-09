# in voting to transition...

# say in voting transitioning...

# get votes
execute in overworld as @a if function mb:gm/check_player_in_game run function mb:gm/voting/get_vote

# tally votes
function mb:gm/voting/tally_votes

# check vote decision...
function mb:gm/voting/check_vote_decision

# display msg...
function mb:gm/voting/display_vote_decision_msg

# clear papers...
execute in overworld as @a if function mb:gm/check_player_in_game run clear @s paper

# create another timer...
# setup args...
data merge storage mb:registers {args:{id:"mb.iv_to_transition",time:30,event_cmd:"function mb:gs/transitions/iv_to_unknown"}}
# we scale by 20 for tick time, scoreboard should have seconds...
execute store result storage mb:registers args.time int 20.0 run scoreboard players get $voting_transition mb.time

function time:create_timer with storage mb:registers args

function time:start_timer {id:"mb.iv_to_transition"}