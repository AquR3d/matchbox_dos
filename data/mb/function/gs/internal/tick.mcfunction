# Game state tick mcfunction

# setup args rq
data merge storage util:registers {args:{cmd:""}}
data modify storage util:registers args.cmd set from storage mb:data game.current_game_state_tick_function

function util:run_command with storage util:registers args