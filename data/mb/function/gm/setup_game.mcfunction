# join team for nametag invisibilityy...

# for every player in the game... add them to a team
execute in overworld as @a if function mb:gm/check_player_in_game run team join mb.sigmas

# assign nick names...
function mb:gm/assign_nicks

# assing roles...
function mb:gm/assign_roles