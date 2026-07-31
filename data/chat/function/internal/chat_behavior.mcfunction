# there are 8 different cases for the chat behavior.... unfortunately... offhand/not offhand * signed/not_signed * has_text/no_text
# for now if it's signed or not in the offhand, we ignore it

# if it's signed, turn it back to normal and return...
execute if data entity @s equipment.offhand.components.minecraft:custom_data.chat_tag \
if data entity @s {equipment:{offhand:{id:"minecraft:written_book"}}} run return run function chat:internal/reset_signed_chat_offhand

# ssame with mainhand...
execute if data entity @s SelectedItem.components.minecraft:custom_data.chat_tag \
if data entity @s {SelectedItem:{id:"minecraft:written_book"}} run return run function chat:internal/reset_signed_chat_mainhand

# if it's not signed and in offhand and has text, PRINT AND RESET
execute if data entity @s equipment.offhand.components.minecraft:custom_data.chat_tag \
if data entity @s equipment.offhand.components.minecraft:writable_book_content.pages[0] run return run function chat:internal/print_and_set_offhand with entity @s

# same case but in main hand, PRINT AND RESET
execute if data entity @s SelectedItem.components.minecraft:custom_data.chat_tag \
if data entity @s SelectedItem.components.minecraft:writable_book_content.pages[0] run return run function chat:internal/print_and_set_mainhand with entity @s
