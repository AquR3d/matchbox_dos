# gets text and prints
# preconditions are that executor has a chat nick
# also searches for chat nick in storage
$tellraw @a [{"text":"<"},{"nbt":"chat_nicks[{UUID:$(UUID)}].nick","storage":"chat:data"},{"text":"> $(text)"}]