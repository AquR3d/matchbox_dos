# adds a player to the game and uses the current game state... which should be the pre-game

# we check the game state first if it's pre-game...

execute unless function mb:gs/gs_is_pre_game run return run \
tellraw @s {"text":"mb:gm/add_player: The game state is not in PRE_GAME.","color":"red"}

# and we check if the player is already in the game...
execute if function mb:gm/check_player_in_game run return run \
tellraw @s {"text":"mb:gm/add_player: CURRENT_PLAYERS already has this player UUID!","color":"red"}

# otherwise, we can add this player
function mb:gm/internal/add_player with entity @s