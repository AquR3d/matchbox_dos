
say in voting...

# create another timer...

function time:create_timer {id:"mb.in_voting",time:230,event_cmd:"function mb:gs/transitions/iv_to_transition"}

execute as @a if function mb:gm/check_player_in_game run function time:show_timer_to_player {id:"mb.in_voting"}
function time:start_timer {id:"mb.in_voting"}