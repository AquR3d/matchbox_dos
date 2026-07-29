# add bossbar to queue
$data modify storage matchbox:timer timers append value {id:"$(id)",value:$(value),show_timer:$(show_timer),"cmd":"$(cmd)"}
# $say added $(id) to queue with value $(value)