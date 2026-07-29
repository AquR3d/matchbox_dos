# this function takes a number and gives the coresponding nicked paper
# setup voting compound to contain nick and player score
# set player score num
$data merge storage matchbox:data {voting_tmp:{nick:"",num:$(nick)}}
# set string nick
$data modify storage matchbox:data voting_tmp.nick set from storage matchbox:data nicks_chat[$(nick)]
# give paper
function mb:voting/give_paper with storage matchbox:data voting_tmp
# remove voting_tmp
data remove storage matchbox:data voting_tmp