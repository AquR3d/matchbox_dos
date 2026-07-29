# create timer display if want to show timer
$data merge storage util:timer {show_timer:$(show_timer)}
$execute if data storage util:timer {show_timer:1} run \
function util:time/internal/create_timer {id:"$(id)",time:$(time)}
# run count down function
$function util:time/internal/count_down {id:"$(id)",value:$(time),show_timer:$(show_timer),"cmd":"$(cmd)"}
