# create queue
# if storage doesn't exist, ggs
$execute unless data storage $(storage) $(nbt) run return fail

# create queue
$data modify storage util:registers queue set from storage $(storage) $(nbt)

# do internal with function...
$function util:internal/for_every_element_in_queue {function:"$(function)"}