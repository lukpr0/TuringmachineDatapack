execute as @e[name="Head"] at @s run clone ~ ~ ~ ~ ~ ~ -5 57 4
execute as @e[name="Pointer"] at @s if block ~ ~ ~ minecraft:iron_block run clone ~-1 ~ ~ ~ ~ ~ -6 57 4
execute as @e[name="Pointer"] at @s unless block ~ ~ ~ minecraft:iron_block run clone ~ ~ ~ ~ ~ ~ -6 57 4