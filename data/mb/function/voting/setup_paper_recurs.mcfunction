# if big no no
$execute if score $max nicks matches ..$(nick) run return fail
# get paper with num function
$execute if entity @a[team=sigmas,scores={nicks=$(nick),alive=1}] run function mb:voting/give_paper_num {nick:$(nick)}
# increment
$scoreboard players set $paper_iter nicks $(nick)
scoreboard players add $paper_iter nicks 1
execute store result storage matchbox:data paper_tmp.nick int 1.0 run scoreboard players get $paper_iter nicks
# do recurs
function mb:voting/setup_paper_recurs with storage matchbox:data paper_tmp