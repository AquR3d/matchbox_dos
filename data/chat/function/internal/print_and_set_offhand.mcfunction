# setup arguments
data modify storage chat:registers args set value {text:"",nick:""}
# set text arguments to text in first page
data modify storage chat:registers args.text set from entity @s \
equipment.offhand.components.minecraft:writable_book_content.pages[0].raw
# set nick argument from storage
$data modify storage chat:registers args.nick set from storage chat:data chat_nicks[{UUID:$(UUID)}].nick
# print
function chat:internal/print with storage chat:registers args
# then reset
function chat:internal/reset_book_offhand