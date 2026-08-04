# this function gets rid of all oak signs within the vicinity of markers...

# if nothing in clearer locs... nt
execute unless data storage mb:data map.clearer_locs[] run return run \
tellraw @s {"text":"mb:game_util/map/clear_oak_signs: There are no clearer locations to clear from.  Please add them with \
/function mb:game_util/map/summon_clearer followed by /function mb:game_util/map/save_clearers","color":"red"}

# copy clearer pos data
data modify storage mb:registers clearer_locs_queue set from storage mb:data map.clearer_locs
# do recurs, this function does 
# fill on the positive axis for both axes except y value is 6 blocks below and 7 above the feet
function mb:game_util/map/clear_oak_signs_recurs