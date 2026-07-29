# THIS FUNCTION IS ONLY INTENDED FOR REMOVING TAGS OFF PLAYERS.

# if no tags, do nothing
execute as @s unless data entity @s Tags[0] run return fail

# otherwise...
# setup arguments...
# create a value nbt for the correct macro
data modify storage util:registers args set value {value:""}
# modify the value to be the current tag
data modify storage util:registers args.value set from entity @s Tags[0]
# call internal remove tags function with said arguments
function util:internal/remove_tags with storage util:registers args
