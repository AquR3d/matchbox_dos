# ADD PARAMETER FOR HIDING THE NICKNAME BY DEFAULT

# if person already has a nametag...
execute if score @s has_nick matches 1 run return run tellraw @s [{"text":"You can only have one nicked nametag at a time.","color":"red"}]
# check if nick has spaces
# ... im not gonna do that rn
# create data to pass function through
# reset data first
#data remove storage nicks:registers new_name{}
#tellraw @a [{"nbt":"new_name","storage":"nicks:registers"}]
$data merge storage nicks:registers {new_name:{UUID:[],nick:"$(nick)"}} 
data modify storage nicks:registers new_name.UUID set from entity @s UUID
#data merge storage util:registers {args:{"storage":"nicks:registers","nbt":"new_name.UUID","value":""}}
#data modify storage util:registers args.value set from entity @s UUID
#tellraw @a [{"nbt":"args.value","storage":"util:registers"}]
#function util:set_as_string
# add to hidden names
data modify storage nicks:data hidden_nicks append from storage nicks:registers new_name
# remove from registers
# for now we do nothing... just know that now the register can be used again
# set score of executor as has nick, where 1 = true, 0 = false
scoreboard players set @s has_nick 1