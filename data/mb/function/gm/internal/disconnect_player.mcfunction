# mvoe from current players to diconnected players...

$data modify storage mb:data game.disconnected_players append from storage mb:data game.current_players[{UUID:$(UUID)}]
$data remove storage mb:data game.current_players[{UUID:$(UUID)}]