# okay so now we get the components.

# store the item in a shulker box.
function util:items/store_item_components with entity @s

# $say $(Thrower)
# we find the uuid associated with this item
$execute in overworld as @a[nbt={UUID:$(Thrower)}] run function util:items/give_dropped_item with storage util:registers args.Item

kill @s