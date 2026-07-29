# check if the provided uuid exists
#$say checking uuid with $(UUID)
$execute if entity @e[nbt={UUID:$(UUID)}] run return 1
$execute unless entity @e[nbt={UUID:$(UUID)}] run return fail