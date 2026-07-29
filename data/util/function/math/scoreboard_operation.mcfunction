# TAKES in args a, and b, op (for operator), and will return...
# a op b
# and put it in return value in util:registers
return run function util:internal/scoreboard_operation with storage util:registers args

# also i think i do it this way for pure purpose of having the ability
# to use /schedule with these functions.

# only scoreboard operator to not be used in >< which is the swap scoreboard... highkey useless.

# also to use addition it's "+=", to subtract is "-=", and to take the minimum is "<"... cool :D