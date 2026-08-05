# if someone dcd...
execute store result score $curr_player_count nicks if entity @a
execute if score $curr_player_count nicks < $prev_player_count nicks run function mb:nametags/update_hide_nick
scoreboard players operation $prev_player_count nicks = $curr_player_count nicks
# check if someone has joined from team sigmas, update hide nick
execute as @a[team=sigmas,scores={joined=1..}] run function mb:nametags/update_hide_nick
# if someone joined in general that was in a game, tp to spawn
execute as @a[team=sigmas,scores={joined=1..}] run function mb:game/spawning/player_join
# check game status
execute store result score $spark_count nicks if entity @a[tag=spark,team=sigmas]
execute store result score $innocent_count nicks if entity @a[tag=!spark,team=sigmas]
# if spark is majority...
execute if score $spark_count nicks >= $innocent_count nicks run function mb:game/commands/spark_win
# if spark doesn't exist
execute if score $spark_count nicks matches ..0 run function mb:game/commands/innocent_win