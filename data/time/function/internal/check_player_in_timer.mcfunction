# checks if uuid exists in timer
$return run execute if data storage timer:data timer_ids[{id:"$(id)"}].players[{UUID:$(UUID)}]