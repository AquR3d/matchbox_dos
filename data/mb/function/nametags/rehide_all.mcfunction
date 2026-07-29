# unreveal all in scoreboard
scoreboard players set $dont_show_all hide_nick 1
# update hide nick
execute as @a[team=sigmas,scores={nicks=0..}] run function mb:nametags/update_hide_nick