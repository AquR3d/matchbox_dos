

# say paused
title @a actionbar {"text":"IN PAUSED - waiting for player to reconnect... /function mb:debug/force_continue to force continue.  Unknown behavior may immerse."}

# detect for a reconnection...

# immobile movement


execute in overworld as @a if function mb:gm/check_player_in_game run function mb:gu/misc/immobile



# test for dc...

function mb:gm/check_for_player_disconnect

# test for rc...

function mb:gm/check_for_player_reconnect

# test if able to go back and unpause...

execute unless data storage mb:data game.disconnected_players[] run title @a actionbar {"text":"eligble to unpause with /function mb:gs/transitions/unpause_game"}