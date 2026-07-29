# check if slot is -106b aka the offhand
# setup args
$data merge storage util:registers {args:{a:$(Slot),b:-106}}
#$say $(Slot)
# run if a == b
function util:logic/equal with storage util:registers args
$execute if data storage util:registers {return:{value:1}} run return run \
function chat:internal/reset_book_offhand {Count:$(Count)}
# replace signed book with writable book at current slot
# weird it doesn't compile even though we don't go here with -106
# to solve this, we just make this a function
$function chat:internal/set_to_chat {Slot:$(Slot),Count:$(Count)}