# adds a player to the game and uses the current game state... which should be the pre-game

# we cgeck the game state first if it's pre-game...

execute unless function mb:gs/gs_is_pre_game run return run \
tellraw @s {"text":"mb:gm/add_player: The game state is not in PRE_GAME.","color":"red"}

# otherwise, we can add this player
