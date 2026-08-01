# check if the provided uuid exists
#$say checking uuid with $(UUID)
$return run execute if entity @a[nbt={UUID:$(UUID)}]