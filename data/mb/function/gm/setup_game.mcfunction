# join team for nametag invisibilityy...

# for every player in the game... add them to a team
execute in overworld as @a if function mb:gm/check_player_in_game run team join mb.sigmas

# first reset nicks...
function nicks:clear_all_nametags

# reset chat names ig
function chat:clear_chat_nicks

# assign nick names...
function mb:gm/assign_nicks

execute in overworld as @a if function mb:gm/check_player_in_game run function mb:gm/internal/assign_nametag_and_chat with entity @s

# assing roles...
function mb:gm/assign_roles

