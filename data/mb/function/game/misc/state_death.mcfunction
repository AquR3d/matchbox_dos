# if no one is marked at the end of the round
execute unless entity @a[tag=s.mark] run return run title @a title {"text":"No one has died."}
# if the person who is marked is also marked by medic...
execute if entity @a[tag=s.mark,tag=m.mark] run return run title @a title {"text":"No one has died."}
# if someone is marked by spark and not saved by medic...
execute as @a[tag=s.mark] store result storage matchbox:data marked_person.nick short 1 run scoreboard players get @s nicks
function mb:nicks/get_nick_chat with storage matchbox:data marked_person
title @a title [{"nbt":"nicks_chat_tmp[0]","storage":"matchbox:data","color":"dark_red"},{"text":" has died."}]