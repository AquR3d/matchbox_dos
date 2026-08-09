# this function will place the shulker box needed for the give back item thing...

# summon marker...
function util:internal/summon_shulker_box_marker

# place shulker box
execute at @e[limit=1,type=marker,tag=util.marker] run setblock ~ ~ ~ shulker_box