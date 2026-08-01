# This is the Utility Datapack, and it's main purpose is to provide a neat library that other datapacks can use
# to get some easier functionality, like doing math or logic.

# All of the non internal commands have no arguments, but need to be setup before hand.
# This means you have to run certain data storage commands with the "util:registers args" nbt
# and add tags to "args" that fit the appropriate macros for the functions.  Otherwise, datapacks can also use the internal
# versions of the function in order to run with macros.

# The main reason for this is for these functions to be able to be run with /schedule possibly, or to easily setup multiple arguments from
# multiple sources, rather than all at once.

# Keep in mind, if a util command is used in a tick function, always performing some math for example, setting up arguments with commands blocks
# likely will not work, because the arguments will immediately get reset.

# There are also return values under the "util:registers return" nbt.
# There are comments under each function to describe which macros need to be changed.  Have fun with this datapack!