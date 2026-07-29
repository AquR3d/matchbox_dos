# load mcfunction
# only real players can use this 


tellraw @a {"text":"+Chat Nicknames by AquR3d","color":"#FF88BB"}

# create data storage for arguments
execute unless data storage chat:registers args run data merge storage chat:registers {args:{}}
execute unless data storage chat:registers return run data merge storage chat:registers {return:{}}
execute unless data storage chat:data chat_nicks run data merge storage chat:data {chat_nicks:[]}