# this function runs in the tick function to detect any dropped give back items
# in order to trigger the even tof giviing back the tiem to the thowerwer.

execute in overworld as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{util_give_back:true}}}}] run function util:items/give_back_item_behavior with entity @s