# for each nick run the associated crouch command
execute as @e[type=text_display,scores={nametags=0..}] if score @s nametags = $tp_iter nametags run function mb:nametags/tp_uncrouched