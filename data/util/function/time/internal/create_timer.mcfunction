# set bossbar values
$bossbar add $(id) "00:00"
# $say set $(id) to 00:00
$bossbar set $(id) max $(time)
$bossbar set $(id) value $(time)
$bossbar set $(id) visible true
$function util:time/internal/update_timer_name_setup {value:$(time),id:"$(id)"}
# $say set time of $(id)
$bossbar set $(id) players @a
# $say made $(id) visible
# add bossbar to queue timers
$data modify storage matchbox:timer bossbar_ids append value {id:"$(id)"}