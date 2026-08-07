# run internal check
# return fail if spark doesn't exist
execute unless data storage mb:data game.current_players[{role:"SPARK"}] run return fail

return run function mb:gm/internal/check_holding_swap_key with storage mb:data game.current_players[{role:"SPARK"}]