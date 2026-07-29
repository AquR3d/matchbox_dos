# tick function
# for present entities with nicks, do nametag behavior
execute as @e[scores={has_nick=1}] run function nicks:internal/nametag_behavior with entity @s
# for nicks with unpresent owners... do search behavior of their owners
execute as @e[type=text_display,tag=nametag] run function nicks:internal/search_behavior with entity @s