#copy Head reading to RAM
#execute as @e[name="Head"] at @s if blocks ~ ~ ~ ~ ~ ~ -1 57 11 all unless block ~ ~ ~ iron_block as @e[name="Pointer"] at @s if blocks ~ ~ ~ ~ ~ ~ 1 57 11 all run clone ~ ~ ~4 ~ ~ ~4 1 57 11

#load info to RAM
#copy initial state to RAM if state pointer is on starting position
execute as @e[name="Pointer"] at @s if block ~ ~ ~ iron_block as @e[name="Marker"] at @s run clone ~-1 ~ ~ ~-1 ~ ~ 1 57 11
#copy Head reading to RAM
execute as @e[name="Head"] at @s run clone ~ ~ ~ ~ ~ ~ 0 57 11

#if pointer.state = ram.state & pointer.read = ram.read
#copy pointer.write to ram.write
execute as @e[name="Pointer"] at @s if blocks ~ ~ ~ ~ ~ ~ 1 57 11 all if blocks ~ ~ ~1 ~ ~ ~1 0 57 11 all run clone ~ ~ ~3 ~ ~ ~3 -1 57 11
#copy ram.write to band
execute as @e[name="Pointer"] at @s if blocks ~ ~ ~ ~ ~ ~ 1 57 11 all if blocks ~ ~ ~1 ~ ~ ~1 0 57 11 all as @e[name="Head"] at @s run clone -1 57 11 -1 57 11 ~ ~ ~
#go right if andesite
execute as @e[name="Pointer"] at @s if blocks ~ ~ ~ ~ ~ ~ 1 57 11 all if blocks ~ ~ ~1 ~ ~ ~1 0 57 11 all if block ~ ~ ~2 polished_andesite as @e[name="Head"] at @s run tp @s ~1 ~ ~

#go left if diorite
execute as @e[name="Pointer"] at @s if blocks ~ ~ ~ ~ ~ ~ 1 57 11 all if blocks ~ ~ ~1 ~ ~ ~1 0 57 11 all if block ~ ~ ~2 polished_diorite as @e[name="Head"] at @s run tp @s ~-1 ~ ~
#copy pointer.newstate to ram.state
#execute as @e[name="Pointer"] at @s if blocks ~ ~ ~ ~ ~ ~ 1 57 11 all if blocks ~ ~ ~1 ~ ~ ~1 0 57 11 all run clone ~ ~ ~4 ~ ~ ~4 -5 58 4
#reset pointer

execute as @e[name="Pointer"] at @s if blocks ~ ~ ~ ~ ~ ~ 1 57 11 all if blocks ~ ~ ~1 ~ ~ ~1 0 57 11 all run tag @s add setstate
execute as @e[tag=setstate] at @s run clone ~ ~ ~4 ~ ~ ~4 1 57 11
execute as @e[name="Pointer"] at @s if blocks ~ ~ ~ ~ ~ ~ 1 57 11 all if blocks ~ ~ ~1 ~ ~ ~1 0 57 11 all run function turingmachine:reset_pointer



tag @e[tag=setstate] remove setstate
#if pointer.state != ram.state  | pointer.state = ram.state & pointer.read !=  ram.read move right
execute as @e[name="Pointer"] at @s unless blocks ~ ~ ~ ~ ~ ~ 1 57 11 all run tag @s add pointerright
execute as @e[name="Pointer"] at @s if blocks ~ ~ ~ ~ ~ ~ 1 57 11 all unless blocks ~ ~ ~1 ~ ~ ~1 0 57 11 all run tag @s add pointerright
execute as @e[tag=pointerright] at @s run tp @s ~1 ~ ~

tag @e[tag=pointerright] remove pointerright


#if end reset
execute as @e[name="Pointer"] at @s if block ~ ~ ~ gold_block run function turingmachine:reset_pointer