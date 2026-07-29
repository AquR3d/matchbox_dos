# set iterator
# scoreboard players set $iterator nicks 0
# execute store result storage matchbox:data iter_tmp.nick int 1.0 run scoreboard players get $iterator nicks
# recursion
function mb:nicks/tell_nick_recurs {nick:0}
# reset iterator
scoreboard players set $iterator nicks -1
data modify storage matchbox:data iter_tmp.nick set value -1