# note: have something tagged with shulkerbox to dictate where the shulkerbox will be placed
# check dropped voting papers
data modify storage matchbox:data cmds.check_dropped_voting set value true
# give voting papers
execute as @a[team=sigmas,scores={nicks=0..,alive=1}] run function mb:voting/give_papers
execute as @a[team=sigmas,scores={nicks=0..,alive=1}] run give @s paper{display:{Name:'{"text":"None"}'}} 1
# tell people ig idk
execute as @a[team=sigmas,scores={nicks=-0..,alive=1}] run title @s title [{"text":"Please select a player to vote for."}]
# tell spectators that they are voting
execute as @a[team=betas] run title @s actionbar [{"text":"The players are now voting."}]
# start voting timer
function mb:game/time/start_timer with storage matchbox:timer voting_time