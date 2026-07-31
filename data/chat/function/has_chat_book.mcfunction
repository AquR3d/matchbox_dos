# detects if the player has the chat book in their offhand.

# return true if the chat book in their offhand.
execute if data entity @s equipment.offhand.components.minecraft:custom_data.chat_tag run return 1
# return true if the chat book is somewhere in their inventory
execute if data entity @s Inventory[{components:{"minecraft:custom_data":{chat_tag:1b}}}] run return 1

# otherwise, return false
return fail