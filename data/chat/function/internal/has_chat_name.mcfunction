# return if we can successfully get the nick with this UUID.
$execute run return \
run data get storage chat:data chat_nicks[{UUID:$(UUID)}]
