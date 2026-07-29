# ask if empty
execute if data storage matchbox:timer {bossbar_ids:[]} run return fail
# with each id... clear a bossbar
function util:time/internal/remove_bossbar with storage matchbox:timer bossbar_ids[0]
# remove from queue
data remove storage matchbox:timer bossbar_ids[0]
# keep going
function util:time/clear_timer_displays