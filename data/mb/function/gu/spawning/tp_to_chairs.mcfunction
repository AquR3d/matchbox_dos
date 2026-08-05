# initialize iterator
# scoreboard players set $tp_iter nicks 0
# function mb:game/chairs/chair_recurs
# scoreboard players set $tp_iter nicks -1

execute as @a[team=sigmas,scores={nicks=0}] run function mb:game/spawning/tp_to_storage with storage matchbox:data chairs[0]
execute as @a[team=sigmas,scores={nicks=1}] run function mb:game/spawning/tp_to_storage with storage matchbox:data chairs[1]
execute as @a[team=sigmas,scores={nicks=2}] run function mb:game/spawning/tp_to_storage with storage matchbox:data chairs[2]
execute as @a[team=sigmas,scores={nicks=3}] run function mb:game/spawning/tp_to_storage with storage matchbox:data chairs[3]
execute as @a[team=sigmas,scores={nicks=4}] run function mb:game/spawning/tp_to_storage with storage matchbox:data chairs[4]
execute as @a[team=sigmas,scores={nicks=5}] run function mb:game/spawning/tp_to_storage with storage matchbox:data chairs[5]
execute as @a[team=sigmas,scores={nicks=6}] run function mb:game/spawning/tp_to_storage with storage matchbox:data chairs[6]
execute as @a[team=sigmas,scores={nicks=7}] run function mb:game/spawning/tp_to_storage with storage matchbox:data chairs[7]
execute as @a[team=sigmas,scores={nicks=8}] run function mb:game/spawning/tp_to_storage with storage matchbox:data chairs[8]
execute as @a[team=sigmas,scores={nicks=9}] run function mb:game/spawning/tp_to_storage with storage matchbox:data chairs[9]