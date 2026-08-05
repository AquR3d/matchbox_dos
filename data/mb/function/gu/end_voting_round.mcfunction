# collect votes
execute as @a[team=sigmas,scores={nicks=0..,alive=1}] run function mb:voting/get_vote
# clear voting papers
# execute as @a[team=sigmas,scores={nicks=0..,alive=1}] run clear @s paper{paper_score:0..}
# get person who got the most votes and state who
function mb:voting/most_votes
# give effect to voted out person
execute as @a[team=sigmas,tag=voted_out] at @s run particle minecraft:elder_guardian ~ ~ ~ ~ ~ ~ 1 1 force @s
# schedule decider
execute unless data storage matchbox:data {vote_person:{nick:-1}} run return run schedule function mb:game/end_end_voting_round 3s
# if no one was voted...
function mb:voting/reset_votes
# onto next round
schedule function mb:game/game_round 3s
# testing
# say OH GOLLEY G THE FREAKING DIEAKIGNE VOTING ROUDN IS VOE RHEHEHEHEHEHEHH