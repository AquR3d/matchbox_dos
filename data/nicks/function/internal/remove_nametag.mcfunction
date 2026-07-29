# kill any nametags
$kill @e[type=text_display,nbt={Tags:["$(UUID)","nametag"]}]
# remove any hidden
$data remove storage nicks:data hidden_nicks[{UUID:$(UUID)}]