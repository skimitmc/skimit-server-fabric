#计算挖掘榜和总榜
#判断条件用于排除地毯小人
execute unless score @s carpetBot matches 1 run scoreboard players operation @s digCounter += @s usedDiaShovel
execute unless score @s carpetBot matches 1 run scoreboard players operation 总挖掘量 digCounter += @s usedDiaShovel
execute unless score @s carpetBot matches 1 run scoreboard players operation 总挖掘量 totalList += @s usedDiaShovel
scoreboard players reset @s usedDiaShovel