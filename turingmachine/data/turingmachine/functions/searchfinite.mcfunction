execute as @e[name="StatesPointer"] at @s if blocks ~ ~ ~ ~ ~ ~ 1 57 11 all run tag @e[name="Head"] add finished
execute as @e[name="Head", tag =! finished] as @e[name="StatesPointer"] at @s run tp @s ~1 ~ ~
execute as @e[name="Head", tag =! finished] as @e[name="StatesPointer"] at @s unless block ~ ~ ~ waxed_copper_block run function turingmachine:searchfinite
execute as @e[name="StatesMarker"] at @s run tp @e[name="StatesPointer"] @s