# check if player even exists in current players...

execute unless function mb:gm/check_player_in_game run return run \
tellraw @s {"text":"mb:gm/internal/remove_player: This player UUID has not been detected to be a current player, so nothing happened.","color":"red"}

# and then remove otherwise.
$data remove storage mb:data game.current_players[{UUID:$(UUID)}]