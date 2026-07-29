# if we can, we remove from tmp array
execute if score $nc_iter nicks >= $max nicks run return fail
$execute if score $nc_iter nicks matches $(nick_num) run return fail
# traverse array and keep going
data remove storage matchbox:data nicks_chat_tmp[0]
# increase iterator
scoreboard players add $nc_iter nicks 1
$function mb:nicks/get_nick_chat_recurs {nick_num:$(nick_num)}