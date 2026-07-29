# set everyone's specified vote to no one
scoreboard players set @a vote -1
# set the accumulated votes to 0
scoreboard players set @a accumulated_votes 0
# reset vote person
scoreboard players set $vote_person accumulated_votes -1
# reset no one vote
scoreboard players set $none accumulated_votes 0