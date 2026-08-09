# okay so now we get the components.

# place shulker box
function util:internal/place_shulker_box

# store the item in a shulker box.
function util:items/store_item_components with entity @s

# $say $(Thrower)
# we find the uuid associated with this item
$execute in overworld as @a[nbt={UUID:$(Thrower)}] run function util:items/give_dropped_item

# get rid of shulker box now
execute at @e[limit=1,type=marker,tag=util.marker] run setblock ~ ~ ~ air
# get rid of marker
kill @e[type=marker,tag=util.marker]

# kill item
kill @s