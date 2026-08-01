# How to use this part of the datapack.

time:create_timer {id:"...",time:(in ticks),event_cmd:"..."}

# All timers are initially hidden.  To show them, you can use the following.

time:show_timer_to_player {id:"..."} # Run this function as the player you want to show it to, and the ID of the timer you want to show.
time:hide_timer_from_player {id:"..."} # This hides it from them again AKA removes them from the list of people to show the timer.

time:universal_show_timer {id:"...",show:true/false}
# This function does not make the timer universally viewable, but instead can make all the players that have been showed with the previous command
# make all of them not see it or see it.

# Then you start the timer with this function.

time:start_timer {id:"..."}

# You can pause the timer, end the timer early, or even speed or slow ALL timers.

time:pause_timer {id:"..."}
time:end_timer {id:"..."}       # Ends the timer and runs the event command associated with the timer.
time:remove_timer {id:"..."}    # Ends the timer and does NOT run the event.

# You can just use the tick rate command to speed or slow all timers, since all timers are dependent on the tick.mcfunction
# Additionally, you can get rid of ALL timers ever made in case you made junk timers.

time:clear_all_timers

# That's all!  Enjoy using timers.