# loot the shulker box and give contents to player
# loot give @s mine ~ ~1 ~ air{drop_contents:true}

# lets do something different.
# do recurs, start with nick 0
function mb:voting/setup_paper_recurs {nick:0}
# lets do something different.
scoreboard players set $paper_iter nicks -1
data modify storage matchbox:data paper_iter.nick set value -1