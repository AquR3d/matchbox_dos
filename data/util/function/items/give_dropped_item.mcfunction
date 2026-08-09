# give dropped item to this player with this Item stuff
# say hi

# looot shulker box
execute at @e[limit=1,type=marker,tag=util.marker] run loot give @s mine ~ ~ ~ bush[custom_data={util_drop_contents:true}]
