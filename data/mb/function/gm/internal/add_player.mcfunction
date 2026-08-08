# add player with this UUID.

$data modify storage mb:data game.current_players append value \
{\
UUID:$(UUID),\
nick:"",\
role:"INNOCENT",\
can_swap:false,\
dead:false,\
marked:{\
    spark:false,\
    medic:false},\
can_mark:false,\
used_arrow:false,\
revealed:false,\
my_vote:[],\
votes:0,\
voted:false}

# copy the current game state
$data modify storage mb:data game.current_players[{UUID:$(UUID)}].game_state set from storage mb:data game.current_game_state

# okay that's it.