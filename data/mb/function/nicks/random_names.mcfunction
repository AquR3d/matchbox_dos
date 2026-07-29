# tag everyone whose names will be changed
tag @a[team=sigmas] add nick.candidate
# set iterator
scoreboard players set $iterator nicks 0
function mb:nicks/random_recurs
# reset iterator
scoreboard players set $iterator nicks -1
tag @a remove nick.candidate