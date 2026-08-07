# woah comments actually work?
tellraw @a [{"text":"+Matchbox Dos by AquR3d","color":"red"},{"text":" v0","color":"white"}]

# create matchbox data and registers...

# these arrays will help determine who is playing and easily keep track of them in a list, as well as the disconnected players.
execute unless data storage mb:data game{} run \
data merge storage mb:data \
{\
    game:{\
        current_players:[],\
        disconnected_players:[],\
        spectators:[],\
        deceased_players:[],\
        final_player_results:[],\
        current_game_state:"",\
        paused_game_state:"",\
        name_pool:[],\
        voting:{\
            tallied_votes:[I;],\
            nick:"",\
            vote_state:"",\
        },\
        end_state:"",\
    }}

    # game.voting.nick will be the nick to vote off...

execute unless data storage mb:data map{} run \
data merge storage mb:data \
{map:{\
    clearer_locs:[],\
    spawn_locs:[],\
    voting_locs:[],\
    spectator_voting_locs:[],\
    spectator_spawn_locs:[],\
    lobby_locs:[],\
    }}

# const hashmap for the game state :)
data merge storage mb:data \
{\
    const:{\
        game_state_tick_functions:[\
            {\
                game_state:"TRANSITION",\
                tick_function:"function mb:gs/tick/transition", \
                pause_transition:"function mb:gs/transitions/transition_to_paused",\
                unpause_transition:"function mb:gs/transitions/paused_to_transition" \
            },\
            {\
                game_state:"PAUSED",\
                tick_function:"function mb:gs/tick/paused"\
            },\
            {\
                game_state:"PRE_GAME",\
                tick_function:"function mb:gs/tick/pre_game" \
            },\
            {\
                game_state:"IN_MAP",\
                tick_function:"function mb:gs/tick/in_map",\
                pause_transition:"function mb:gs/transitions/im_to_paused",\
                unpause_transition:"function mb:gs/transitions/paused_to_im" \
            },\
            {\
                game_state:"IN_DISCUSSION",\
                tick_function:"function mb:gs/tick/in_discussion",\
                pause_transition:"function mb:gs/transitions/id_to_paused",\
                unpause_transition:"function mb:gs/transitions/paused_to_id" \
            },\
            {\
                game_state:"IN_VOTING",\
                tick_function:"function mb:gs/tick/in_voting",\
                pause_transition:"function mb:gs/transitions/iv_to_paused",\
                unpause_transition:"function mb:gs/transitions/paused_to_iv" \
            }\
        ],\
    vote_decisions:[\
        {\
            decision:"SKIP",\
            display_cmd:"title @a title skip",\
        },\
        {\
            decision:"TIE",\
            display_cmd:"title @a title tie",\
        },\
        {\
            decision:"VOTE",\
            display_cmd:"function mb:gm/voting/display_voted_nick_msg with storage mb:data game.voting",\
        },\
        {\
            decision:"ERROR",\
            display_cmd:"say ruh roh voting error detected no one to vote off",\
        },\
        ],\
    end_state_functions:[\
        {\
            state:"CONTINUE",\
            event_cmd:"function mb:gs/transitions/iv_to_im",\
        },\
        {\
            state:"INNOCENT",\
            event_cmd:"say innocent won",\
        },\
        {\
            state:"SPARK",\
            event_cmd:"say spark won",\
        },\
        ],\
    time:[\
        ]\
    }\
}

# const.end_state_functions are the functions for what to do when the game ends...
# const.end_state_functions.state say who won or if no one one just continue...

execute unless data storage mb:registers args run data merge storage mb:registers \
{args:{},\
return:{value:0},\
current_players_queue:[],\
disconnected_players_queue:[],\
name_pool_queue:[],\
clearer_locs_queue:[],\
spawn_locs_queue:[]}

# create matchbox scoreboard... idk
scoreboard objectives add mb.data dummy
scoreboard objectives add mb.crossbow minecraft.used:minecraft.crossbow
scoreboard objectives add mb.swap trigger
execute unless score $prev_player_count mb.data = $prev_player_count mb.data run scoreboard players set $prev_player_count mb.data -1
execute unless score $player_count mb.data = $player_count mb.data run scoreboard players set $player_count mb.data 0
execute unless score $skip_vote mb.data = $skip_vote mb.data run scoreboard players set $skip_vote mb.data 0
execute unless score $spark_selected_item_slot mb.data = $spark_selected_item_slot mb.data run scoreboard players set $spark_selected_item_slot mb.data -1

# for detecting player dc...

# make team... for visibility ig
team add mb.sigmas
team modify mb.sigmas nametagVisibility never
team modify mb.sigmas friendlyFire false
team modify mb.sigmas deathMessageVisibility never