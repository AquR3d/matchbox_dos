# check spark marked...

# if not empty hand slot, ggs, no mark so reset right clicked...
execute if data entity @s SelectedItem run return run scoreboard players set @s util.right_clicked_player 0

# check player interaction existence...
# setup args...
data merge storage mb:data {args:{UUID:[]}}
$data modify storage mb:data args.UUID set from storage util:data player_interactions[{from:$(UUID)}].to

# if person spark right clicked is not in game, dont mark.
execute unless function mb:gm/internal/check_uuid_in_game run return run scoreboard players set @s util.right_clicked_player 0

# setup args
$data modify storage mb:data args.UUID set from storage util:data player_interactions[{from:$(UUID)}].to

# otherwise we marked other player with open hand good.
function mb:gm/spark_mark_player with storage mb:registers args

# set can mark to false now...
data modify storage mb:data game.current_players[{role:"SPARK"}].can_mark set value false