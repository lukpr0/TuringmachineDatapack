function turingmachine:searchfinite
execute as @e[tag =! finished] run function turingmachine:searchstate
execute as @e[tag = finished] run say terminated
#tag @e remove finished