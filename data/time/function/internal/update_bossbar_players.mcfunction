# this updates what players to show to the bossbar...

# check if timer exists..
$execute unless data storage timer:data timer_ids[{id:"$(id)"}] run return fail

# otherwise, get players and tag each, and show
$function util:for_every_element_in_queue {storage:"timer:data",nbt:"timer_ids[{id:\"$(id)\"}].players",function:"time:internal/tag_show_timer"}

# show to all the tagged people...
$bossbar set $(id) players @a[tag=time.show_timer]

# remove tag...
tag @a[tag=time.show_timer] remove time.show_timer