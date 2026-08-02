# get array elementat storage at nbt AT VALUE... valid index assumption.

$data modify storage util:registers return.value set from storage $(storage) $(nbt)[$(value)]

return run data get storage util:registers return.value