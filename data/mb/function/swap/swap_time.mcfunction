# in case we do it in the middle of a reset cooldown
execute if score $spark swap matches 1 run return run function mb:swap/reset_cooldown
# timer goes by seconds
# change end of this execute to run next timer
execute if score $timer swap >= $cd swap run return run function mb:swap/reset_cooldown
# else we continue the timer
scoreboard players add $timer swap 1
# display cd to spark
execute as @a[team=sigmas,tag=spark] run \
title @s actionbar [\
    {"score":{"name":"$cd","objective":"swap"},"color":"red"},\
    {"text":"s/","color":"red"},\
    {"score":{"name":"$timer","objective":"swap"},"color":"red"},\
    {"text":"s","color":"red"}]
schedule function mb:swap/swap_time 1s