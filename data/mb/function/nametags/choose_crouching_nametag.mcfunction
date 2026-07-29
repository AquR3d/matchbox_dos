execute if entity @s[predicate=mb:nametags/is_sneaking] at @s run function mb:nametags/crouched_nametag
execute unless entity @s[predicate=mb:nametags/is_sneaking] at @s run function mb:nametags/uncrouched_nametag

#say hi
#tellraw @a {"score":{"name":"$tp_iter","objective":"nametags"}}