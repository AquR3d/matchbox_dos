# if max, stop
$execute if score $max nicks matches ..$(nick) run return fail
# if not, say msg and increment
$tellraw @a[team=sigmas,scores={nicks=$(nick)}] \
[{"text":"\""},{"nbt":"nicks_chat[$(nick)]","storage":"matchbox:data","color":"yellow"},{"text":"\" is your nickname."}]
# increment
$scoreboard players set $iterator nicks $(nick)
scoreboard players add $iterator nicks 1
execute store result storage matchbox:data iter_tmp.nick int 1.0 run scoreboard players get $iterator nicks
# call again
function mb:nicks/tell_nick_recurs with storage matchbox:data iter_tmp