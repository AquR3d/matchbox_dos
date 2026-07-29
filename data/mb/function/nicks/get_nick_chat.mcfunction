# modify temp array
data modify storage matchbox:data nicks_chat_tmp set from storage matchbox:data nicks_chat
# set nick chat itr to 0
scoreboard players set $nc_iter nicks 0
# do recursion
$function mb:nicks/get_nick_chat_recurs {nick_num:$(nick)}
# now the name is stores in nicks_chat_tmp[0]
# tellraw @a [{"nbt":"nicks_chat_tmp[0]","storage":"matchbox:data"}]