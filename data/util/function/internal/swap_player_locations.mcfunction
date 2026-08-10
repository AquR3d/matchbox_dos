# internal swap locations...

# say player 1 and 2
$tellraw @a [{"text":"swapping "},{"selector":"@a[limit=1,nbt={UUID:$(player_1)}]"},{"text":" and "},{"selector":"@a[limit=1,nbt={UUID:$(player_2)}]"}]

# summon marker at person 1...
$execute in overworld at @a[nbt={UUID:$(player_1)},limit=1] run summon marker ~ ~ ~ {Tags:["util.swap"]}

# tp person 1 to person 2
$execute in overworld at @a[nbt={UUID:$(player_2)},limit=1] as @a[nbt={UUID:$(player_1)},limit=1] run tp @s ~ ~ ~

# tp person 2 to marker...
$execute in overworld at @e[type=marker,tag=util.swap,limit=1] as @a[nbt={UUID:$(player_2)},limit=1] run tp @s ~ ~ ~

# kill marker
kill @e[type=marker,tag=util.swap]