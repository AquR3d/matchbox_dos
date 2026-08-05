# any dropped sign becomes a custom one
# such a long command... btw hideflags 16 hides can place on flag
# apprently \ allows u to continue a command ig lol
execute as @e[type=item,nbt={Item:{id:"minecraft:oak_sign"}}] unless data entity @s Item.components run data modify entity @s Item merge value \
{components:{"minecraft:can_place_on":{}}}