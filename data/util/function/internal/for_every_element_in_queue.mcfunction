# do the function...

$function $(function) with storage util:registers queue[0]

# remove from queue
data remove storage util:registers queue[0]

# if empty ggs
execute unless data storage util:registers queue[] run return fail

# run again
$function util:internal/for_every_element_in_queue {function:"$(function)"}