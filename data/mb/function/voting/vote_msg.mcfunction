# get name of voted person
function mb:nicks/get_nick_chat with storage matchbox:data vote_person
# say text
title @a subtitle [{"nbt":"nicks_chat_tmp[0]","storage":"matchbox:data","color":"white"},{"text":" has been voted out."}]
title @a title [{"text":"Bye!","color":"yellow"}]