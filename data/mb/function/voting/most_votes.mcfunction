# scoreboard max votes stuff
scoreboard players set $max accumulated_votes -1
# get number with most votes
scoreboard players set $iterator accumulated_votes 0
function mb:voting/most_votes_recurs
scoreboard players set $iterator accumulated_votes 0
# state the max votes
#tellraw @a [{"text":"max accumulated votes is:"},{"score":{"name":"$max","objective":"accumulated_votes"}}]
# determine who has the most votes
execute as @a[team=sigmas,scores={nicks=0..,alive=1}] if score @s accumulated_votes = $max accumulated_votes run scoreboard players add $iterator accumulated_votes 1
# state number of people who have the most votes
#tellraw @a [{"text":"ppl with max accumulated votes is:"},{"score":{"name":"$iterator","objective":"accumulated_votes"}}]
# if there is at least 2 people with the most votes... tie
execute if score $iterator accumulated_votes matches 2.. run data modify storage matchbox:data vote_person.nick set value -1
# if there is only one person with the most votes, vote them out ( and tag them )!!!
execute if score $iterator accumulated_votes matches 1 \
as @a[team=sigmas,scores={nicks=0..,alive=1}] if score @s accumulated_votes = $max accumulated_votes run \
function mb:voting/get_voted_person
# if max accumulated votes was 0...
execute if score $max accumulated_votes matches 0 run data modify storage matchbox:data vote_person.nick set value -1
# if no one votes is more than max accumulated
execute if score $max accumulated_votes <= $none accumulated_votes run data modify storage matchbox:data vote_person.nick set value -1

# reset iterator again
# scoreboard players set $iterator accumulated_votes 0
# scoreboard players set $max accumulated_votes -1

# testing say who the person most voted is
# execute if score $vote_person accumulated_votes matches -1 run tellraw @a "TIE"
# execute unless score $vote_person accumulated_votes matches -1 \
# as @a[scores={nicks=0..,alive=1}] if score @s nicks = $vote_person accumulated_votes run say i have the most votes
# say who got voted
execute if data storage matchbox:data {vote_person:{nick:-1}} run return run title @a title [{"text":"No one has been voted out."}]
execute unless data storage matchbox:data {vote_person:{nick:-1}} run function mb:voting/vote_msg
