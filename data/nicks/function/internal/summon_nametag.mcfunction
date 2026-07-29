#$say summoned $(nick)
# remove from data
$data remove storage nicks:data hidden_nicks[{UUID:$(UUID)}]
# summon nametag in storage at position of executor's eyes
$execute at @s anchored eyes run summon text_display ^ ^.4 ^ {Tags:["$(UUID)","nametag"],text:'$(nick)',billboard:"center",teleport_duration:2}