#say store
# filter tags, if entity has more than one tag... filter tags and run again
execute if function nicks:internal/filter_tags run return run function nicks:internal/store_nametag with entity @s
# organize data
#$say $(Tags)
$data merge storage nicks:registers {tags:$(Tags)}
$data merge storage nicks:registers {tmp_store:{UUID:[],nick:'$(text)'}}
# parse string and store
data modify storage util:registers args set value {"storage":"nicks:registers","nbt":"tmp_store.UUID","value":""}
data modify storage util:registers args.value set from storage nicks:registers tags[0]
function util:parse_string
#tellraw @a [{"text":"store: "},{"nbt":"tmp_store.UUID","storage":"nicks:registers"}]
# append to hidden nicks
data modify storage nicks:data hidden_nicks append from storage nicks:registers tmp_store
# delete register data
# do nothing for now
# kill the nametag
kill @s