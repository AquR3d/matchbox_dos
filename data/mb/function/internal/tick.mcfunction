# run the GAME_STATE tick function

# first, we check for spectator dcs...
function mb:gm/check_for_spectator_disconnect

# then we check for reconnects...
execute in overworld as @a[scores={mb.join=1..}] run function mb:gm/on_server_join

# then we do game stuff...
function mb:gs/internal/tick

