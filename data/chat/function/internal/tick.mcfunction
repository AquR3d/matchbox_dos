# tick mcfunction for chat

# detect text in special book with nbt Chat, for people who have a chat name
execute as @a if function chat:has_chat_name run function chat:internal/check_chat
