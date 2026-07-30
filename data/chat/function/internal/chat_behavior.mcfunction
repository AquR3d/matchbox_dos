# there are 8 different cases for the chat behavior.... unfortunately... offhand/not offhand * signed/not_signed * has_text/no_text

# this functions checks if the chat book exists in their inventory, and if it has text in it
execute unless data entity @s Inventory[{components:{"minecraft:custom_data":{chat.tag:1b}}}] run return fail

# testing
# say hi

# check if it's signed, for now signed books just get replaced
execute if data entity @s Inventory[{components:{"minecraft:custom_data":{chat.tag:1b}},id:"minecraft:written_book"}] run return run \
function chat:internal/reset_book with entity @s Inventory[{components:{"minecraft:custom_data":{chat.tag:1b}},id:"minecraft:written_book"}]

# okay NOWWWWWW we check for text... if we have text.. print
execute if data entity @s Inventory[{components:{"minecraft:custom_data":{chat.tag:1b}}}].components.minecraft:writable_book_content run return run \
function chat:internal/print_and_set with entity @s