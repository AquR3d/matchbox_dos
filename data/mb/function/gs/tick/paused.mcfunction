title @a actionbar {"text":"in paused"}

# detect for a reconnection...













# test for dc...

function mb:gm/check_for_player_disconnect

# test for rc...

function mb:gm/check_for_player_reconnect

# test if able to go back and unpause...

execute unless data storage mb:data game.disconnected_players[] run title @a actionbar {"text":"eligble to unpause with /function mb:gs/transitions/unpause_game"}