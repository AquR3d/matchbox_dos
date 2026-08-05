# remove scoreboard...

scoreboard players reset * has_nick
scoreboard players reset * hide_nick

# remove from storage and kill text displays...
kill @e[type=text_display,tag=nametag]

data modify storage nicks:data hidden_nicks set value []