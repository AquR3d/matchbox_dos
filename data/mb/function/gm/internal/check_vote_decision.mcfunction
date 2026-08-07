# wit macro $value we compare stuff...

# now we check if tie with skip votes
$execute if score $skip_vote mb.data matches $(value) run return run data modify storage mb:data game.voting.vote_state set value "SKIP"

# check if max is a tie...
$execute store result score $count_of_nicks_with_highest_votes mb.data if data storage mb:data game.current_players[{votes:$(value)}]
execute if score $count_of_nicks_with_highest_votes mb.data matches 2.. run return run \
data modify storage mb:data game.voting.vote_state set value "TIE"

# if it's somehow 0... then uh ruh roh we just go to a skip but we should NEVER be here...
execute if score $count_of_nicks_with_highest_votes mb.data matches ..0 run return run \
data modify storage mb:data game.voting.vote_state set value "ERROR"

# otherwise... should be 1, set to vote
data modify storage mb:data game.voting.vote_state set value "VOTE"
# save the nick to vote off...
$data modify storage mb:data game.voting.nick set from storage mb:data game.current_players[{votes:$(value)}].nick