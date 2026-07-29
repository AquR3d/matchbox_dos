#say search behavior
# filter tags
execute if function nicks:internal/filter_tags run return run function nicks:internal/search_behavior with entity @s
# get special nick uuid
$data merge storage nicks:registers {tags:$(Tags)}
data merge storage util:registers {args:{UUID:[]}}
data modify storage util:registers args.UUID set from storage nicks:registers tags[0]
# if there is no entity with this uuid (aka no owner), store text display in data
#tellraw @a [{"text":"from search behavior: "},{"nbt":"tmp_uuid.UUID","storage":"nicks:registers"}]
execute unless function util:uuid_exists run return run function nicks:internal/store_nametag with entity @s
# otherwise isince this person exists, see if they have a nametag
# for now it's not a problem cuz if the uuid exists but they dont have the scoreboard, well this thing should be dead already
tag @s add nametag