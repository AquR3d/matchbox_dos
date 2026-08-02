# setup return
data merge storage util:registers {return:{value:0}}

# duplicate array

data merge storage util:registers {args:{value:[]}}
$data modify storage util:registers args.value set from storage $(storage) $(nbt)

# run recursive count
return run function util:internal/get_array_size_recurs