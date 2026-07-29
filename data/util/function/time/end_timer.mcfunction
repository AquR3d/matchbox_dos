# remove bossbar display
$bossbar remove $(id)
$data remove storage matchbox:timer bossbar_ids[{id:"$(id)"}]
# reset timer
scoreboard players set $timer timer 0
# for safety precautions ig
$data remove storage matchbox:timer timers[{id:"$(id)"}]
# run command
$$(cmd)