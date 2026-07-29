# we get the type of vote for a person
# see if the person voted
execute store success score @s vote run data get entity @s SelectedItem.tag.player_score
execute unless data entity @s SelectedItem.tag.player_score run scoreboard players set @s vote -1
# if they didnt, make their vote no one
execute if score @s vote matches 0 run scoreboard players set @s vote -1
# accumulate vote to no one if no vote
execute if score @s vote matches -1 run scoreboard players add $none accumulated_votes 1
# if they did, store it
execute if score @s vote matches 1 run execute store result score @s vote run data get entity @s SelectedItem.tag.player_score
# tag them for this next part yeah?
tag @s add voting
# then accumulate the votes to that voted person
execute as @a[scores={nicks=0..,alive=1}] if score @s nicks = @a[limit=1,tag=voting] vote run scoreboard players add @s accumulated_votes 1
# remove the tag
tag @s remove voting