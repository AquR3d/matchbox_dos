# save uuid's...

# check for existence first ig?
$execute unless entity $(from) run return fail
$execute unless entity $(to) run return fail

# setup args..
data merge storage util:registers {args:{from:[],to:[]}}

$data modify storage util:registers args.from set from entity $(from) UUID
$data modify storage util:registers args.to set from entity $(to) UUID

# run internal
function util:save_interaction with storage util:registers args