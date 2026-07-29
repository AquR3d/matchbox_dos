# get rid of all timer schedules
schedule clear util:time/internal/count_down_dispatch
# get rid of timers
data merge storage matchbox:timer {timers:[]}
# clear boss bars
function util:time/clear_timer_displays
# swap time???????????/
schedule clear mb:swap/swap_time
