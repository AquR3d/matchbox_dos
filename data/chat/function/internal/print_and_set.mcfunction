# setup arguments
$data modify storage chat:registers args set value {text:"",UUID:$(UUID)}
# set text arguments to text in first page
data modify storage chat:registers args.text set from entity @s Inventory[{components:{"minecraft:custom_data":{Chat:1b}}}].components.minecraft:writable_book_content.pages[0].raw
# print
function chat:internal/print with storage chat:registers args
# then set
function chat:internal/reset_book with entity @s Inventory[{components:{"minecraft:custom_data":{Chat:1b},id:"minecraft:writable_book"}}].components