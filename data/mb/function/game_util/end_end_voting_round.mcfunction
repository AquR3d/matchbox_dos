# reset votes
function mb:voting/reset_votes
# if voted out is the spark, then end game, voted_out tag is here bc runng function most votes tags the person with most votes
execute if entity @a[team=sigmas,tag=spark,tag=voted_out] run return run function mb:game/commands/innocent_win
# kill voted, this can trigger an end game bc it decreases players of sigmas
execute as @a[team=sigmas,tag=voted_out] run function mb:game/misc/kill_voted
# get rid of voted out tag
tag @a remove voted_out
# go to game round
function mb:game/game_round