# this function gets rid of all oak signs within the vicinity of armorstands
# copy clearer pos data
data modify storage matchbox:data clearer_locs_tmp set from storage matchbox:data clearer_locs
# do recurs, this function does 
# fill on the positive axis for both axes except y value is 6 blocks below and 7 above the feet
function mb:game/map/clear_oak_signs_recurs