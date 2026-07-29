# This runs on command /reload

tellraw @a {"text":"BIG COCK IN MY AHH","color":"aqua"}

# put everyone on same team
team add sigmas "Player"
team modify sigmas color green
team modify sigmas nametagVisibility never
team modify sigmas deathMessageVisibility never
team modify sigmas friendlyFire true
team modify sigmas seeFriendlyInvisibles false
# team join sigmas @a
# make spectators team
team add betas "Spectator"
team modify betas color gray

# might remove later, reset marked tags
tag @a remove m.mark
tag @a remove s.mark
tag @a remove spark
tag @a remove medic
tag @a remove voted_out
# kill any interaction entities
kill @e[type=interaction,tag=s.int]
kill @e[type=interaction,tag=m.int]
# kill text displays
kill @e[type=text_display,scores={nametags=0..}]
# tag @r add spark
# tag @r[tag=!spark] add medic
tellraw @a[tag=spark] {"text":"You are the spark."}
tellraw @a[tag=medic] {"text":"You are the medic."}
data merge storage matchbox:data {paper_given:0b}
execute unless data storage matchbox:data nicks run data merge storage matchbox:data {nicks:[\
    '"BIG PENIS"','"luanch(haha lunch)"','"hamborgor"','"chezYEAHH"','"gl1tchyb0yl1ve"','"sussybaka"','"googoogaagaa"','"idkanymore"','"AMONGUS"','"poopoo"'\
    ]}
execute unless data storage matchbox:data nicks run data merge storage matchbox:data {nicks_chat:[\
    "","","","","","","","","",""\
    ]}
function mb:chat/update_chat_names
# iter tmp is for displaying nicks to people
data merge storage matchbox:data {iter_tmp:{nick:-1}}
data merge storage matchbox:data {paper_tmp:{nick:-1}}
data merge storage matchbox:data {nicks_chat_tmp:[]}
data merge storage matchbox:data {vote_person:{nick:-1}}
data merge storage matchbox:data {marked_person:{nick:-1}}
# last hotkey
data merge storage matchbox:data {swapKey:8b}
# cmds to run on repeat
data merge storage matchbox:data {cmds:{\
    check_swap:false,check_s_mark:false,check_m_mark:false,custom_signs:false,check_missed_arrow:false,glowing_reveals:false,tp_nametags:false,chat:false,check_arrow:false,\
    check_give_back:true,player_count:false,joined:true\
    }}
# customization
execute unless data storage matchbox:data custom run \
data merge storage matchbox:data {custom:{show_nametags_during_discussion:false,reset_reveal_per_round:true,kill_missed_arrow:false}}
# spawn locations
execute unless data storage matchbox:data spawn_locs run data merge storage matchbox:data {spawn_locs:[]}
execute unless data storage matchbox:data spawn_locs_tmp run data merge storage matchbox:data {spawn_locs_tmp:[]}
# clearer locations for clearing oak signs in the map
execute unless data storage matchbox:data clearer_locs run data merge storage matchbox:data {clearer_locs:[]}
execute unless data storage matchbox:data clearer_locs run data merge storage matchbox:data {clearer_locs_tmp:[]}
# lobby spawn pos
execute unless data storage matchbox:data lobby_pos run data merge storage matchbox:data {lobby_pos:{x:0,y:0,z:0}}
execute unless data storage matchbox:data spec_discussion_pos run data merge storage matchbox:data {spec_discussion_pos:{x:0,y:0,z:0}}
execute unless data storage matchbox:data spec_game_pos run data merge storage matchbox:data {spec_game_pos:{x:0,y:0,z:0}}
execute unless data storage matchbox:data wait_start run data merge storage matchbox:data {wait_start:{x:0,y:0,z:0}}
execute unless data storage matchbox:data wait_swap run data merge storage matchbox:data {wait_swap:{x:0,y:0,z:0}}
execute unless data storage matchbox:data chairs run \
data merge storage matchbox:data {chairs:[\
    {x:0,y:0,z:0},{x:0,y:0,z:0},{x:0,y:0,z:0},{x:0,y:0,z:0},{x:0,y:0,z:0},{x:0,y:0,z:0},{x:0,y:0,z:0},{x:0,y:0,z:0},{x:0,y:0,z:0},{x:0,y:0,z:0}\
    ]}


# initialize scoreboards
scoreboard objectives add threw_item dummy "ThrewItem"
scoreboard objectives add nicks dummy "nicks"
scoreboard objectives add timer dummy "timer"
scoreboard objectives add arrow dummy "HasArrow"
scoreboard objectives add unrevealed dummy "Unrevealed"
scoreboard objectives add hide_nick dummy "HideNick"
scoreboard objectives add used_mark dummy "UsedMark"
scoreboard objectives add swap dummy "CanUseSwap"
scoreboard objectives add nametags dummy "nametags"
scoreboard objectives add alive dummy "Alive"
scoreboard objectives add vote dummy "VotedForNick"
scoreboard objectives add accumulated_votes dummy "VotesReceived"
scoreboard objectives add joined minecraft.custom:minecraft.leave_game "Joined"
# marking / looking at mechanics s for spark, m for medic
scoreboard objectives add find_look.temp dummy
scoreboard objectives add find_look.const dummy
# just a little fun
scoreboard objectives add mosthits dummy "MostHits"
# reset scoreboard players
scoreboard players reset * threw_item
scoreboard players reset * nicks
scoreboard players reset * timer
scoreboard players reset * arrow
scoreboard players reset * unrevealed
scoreboard players reset * hide_nick
scoreboard players reset * used_mark
scoreboard players reset * swap
scoreboard players reset * nametags
scoreboard players reset * alive
scoreboard players reset * vote
scoreboard players reset * accumulated_votes
scoreboard players reset * mosthits
scoreboard players reset * find_look.temp
scoreboard players reset * find_look.const
scoreboard players reset * joined

function mb:voting/reset_votes
scoreboard players set @a alive 1
scoreboard players set $spark swap 1
scoreboard players set $timer swap 0
# 2 minutes or 120 seconds
scoreboard players set $cd swap 120
scoreboard players set $nc_iter nicks -1
scoreboard players set $spark_count nicks -1
scoreboard players set $innocent_count nicks -1
scoreboard players set $iterator nicks -1
scoreboard players set $death_itr nicks 0
scoreboard players set $vote_iter nicks 0
scoreboard players set $iterator nametags -1
scoreboard players set $tag_exists nametags 0 
scoreboard players set $tp_iter nametags -1
scoreboard players set $tp_iter nicks -1
scoreboard players set $max accumulated_votes -1
# we will have 10 max nicks or players
scoreboard players set $max nicks 10
scoreboard players set $spark used_mark 0
scoreboard players set $medic used_mark 0
scoreboard players set @a unrevealed 1
scoreboard players set @a arrow 1
# random nicks
# function mb:nicks/random_names
# initialize to not show nicks at the moment
scoreboard players set $dont_show_all hide_nick 1
execute as @a run function mb:nametags/update_hide_nick

# get swap key from current data storage
execute store result score $swap_key swap run data get storage matchbox:data swapKey

# constants
scoreboard players set 2 find_look.const 2

# might need to get rid of this later if it's a logic problem vvv
advancement revoke @a only minecraft:adventure/ol_betsy

# more timer display stuff
execute unless data storage matchbox:timer timer_name.minutes run data merge storage matchbox:timer {timer_name:{minutes:0}}
execute unless data storage matchbox:timer timer_name.seconds run data merge storage matchbox:timer {timer_name:{seconds:0}}
execute unless data storage matchbox:timer timer_name.id run data merge storage matchbox:timer {timer_name:{id:""}}
data merge storage matchbox:timer {timers:[]}
data merge storage matchbox:timer {bossbar_ids:[]}
data merge storage matchbox:timer {curr_timer:{id:"",value:0}}
data merge storage matchbox:timer {cd_tmp:{id:"",value:0}}
# timer bossbar display stuff
execute unless score $minutes timer matches 0.. run scoreboard players set $minutes timer 0
execute unless score $seconds timer matches 0.. run scoreboard players set $seconds timer 0
execute unless score $seconds_per_minute timer matches 60 run scoreboard players set $seconds_per_minute timer 60
function mb:game/time/stop_timer
# the numbers are in seconds - THESE TAGS MUST BE MUTUALLY EXCLUSIVE
# set default time limits
# round time should be 10 minutes on default or 600 seconds
#execute unless data storage matchbox:timer round_time run 
data merge storage matchbox:timer {round_time:{id:"matchbox:round",time:420,show_timer:1b,"cmd":"function mb:game/end_round"}}
#execute unless data storage matchbox:timer end_round_time run 
data merge storage matchbox:timer {end_round_time:{id:"matchbox:end_round",time:5,show_timer:0b,"cmd":"function mb:game/discussion_round"}}
#execute unless data storage matchbox:timer discussion_time run 
data merge storage matchbox:timer {discussion_time:{id:"matchbox:discussion",time:180,show_timer:1b,"cmd":"function mb:game/voting_round"}}
#execute unless data storage matchbox:timer voting_time run 
data merge storage matchbox:timer {voting_time:{id:"matchbox:voting",time:90,show_timer:1b,"cmd":"function mb:game/end_voting_round"}}
# create timer guy
scoreboard players set $timer timer 0



# big cock in my ahh finished
tellraw @a {"text":"mmm yessssss","color":"red"}
tellraw @a {"text":"Matchbox v0.992 Datapack by AquR3d","color":"aqua"}