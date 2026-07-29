# we have to do this for iteration or else the commands essentially do it al at the same time
execute as @a[scores={nicks=0..,alive=1}] if score @s accumulated_votes = $iterator accumulated_votes \
if score @s accumulated_votes >= $max accumulated_votes run \
scoreboard players operation $max accumulated_votes = @s accumulated_votes
# increment iterator and go again
scoreboard players add $iterator accumulated_votes 1
# if over max players, STOP IT
execute if score $iterator accumulated_votes >= $max nicks run return run scoreboard players set $iterator accumulated_votes 0
# if can keep going, keep going
function mb:voting/most_votes_recurs