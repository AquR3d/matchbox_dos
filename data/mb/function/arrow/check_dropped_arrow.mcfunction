# check if a player droppe dtheir arrow and give it back to them
execute if entity @e[nbt={Item:{tag:{"player_score":0}}}] run give @a[scores={nicks=0}] minecraft:spectral_arrow{"player_score":0} 1
execute if entity @e[nbt={Item:{tag:{"player_score":1}}}] run give @a[scores={nicks=1}] minecraft:spectral_arrow{"player_score":1} 1
execute if entity @e[nbt={Item:{tag:{"player_score":2}}}] run give @a[scores={nicks=2}] minecraft:spectral_arrow{"player_score":2} 1
execute if entity @e[nbt={Item:{tag:{"player_score":3}}}] run give @a[scores={nicks=3}] minecraft:spectral_arrow{"player_score":3} 1
execute if entity @e[nbt={Item:{tag:{"player_score":4}}}] run give @a[scores={nicks=4}] minecraft:spectral_arrow{"player_score":4} 1
execute if entity @e[nbt={Item:{tag:{"player_score":5}}}] run give @a[scores={nicks=5}] minecraft:spectral_arrow{"player_score":5} 1
execute if entity @e[nbt={Item:{tag:{"player_score":6}}}] run give @a[scores={nicks=6}] minecraft:spectral_arrow{"player_score":6} 1
execute if entity @e[nbt={Item:{tag:{"player_score":7}}}] run give @a[scores={nicks=7}] minecraft:spectral_arrow{"player_score":7} 1
execute if entity @e[nbt={Item:{tag:{"player_score":8}}}] run give @a[scores={nicks=8}] minecraft:spectral_arrow{"player_score":8} 1
execute if entity @e[nbt={Item:{tag:{"player_score":9}}}] run give @a[scores={nicks=9}] minecraft:spectral_arrow{"player_score":9} 1

# kill any dropped spectral arrow
execute if entity @e[type=item,nbt={Item:{id:"minecraft:spectral_arrow"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:spectral_arrow"}}]