#计算受破基岩量和总榜
#判断条件用于排除地毯小人
execute unless score @s carpetBot matches 1 run scoreboard players operation @s bedrockBreaked += @s fz.bbl
execute unless score @s carpetBot matches 1 run scoreboard players operation 全员头铁 bedrockBreaked += @s fz.bbl
execute unless score @s carpetBot matches 1 run scoreboard players operation 全员头铁 totalList += @s fz.bbl
execute unless score @s carpetBot matches 1 run scoreboard players reset @s fz.bbl
#重置触发该函数的成就
advancement revoke @s only fz:scoreboards/bedrockbreaked