# start recursive process
execute if entity @a[tag=nick.candidate] as @r[tag=nick.candidate] run function mb:nicks/name_to_itr
# increment iterator
scoreboard players add $iterator nicks 1
# if more candidates, call again.
execute if entity @a[tag=nick.candidate] run function mb:nicks/random_recurs