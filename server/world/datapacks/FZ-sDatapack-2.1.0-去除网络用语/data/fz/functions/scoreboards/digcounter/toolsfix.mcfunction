#为digtrigger函数修正非挖掘的使用带来的加分(对一些方块使用工具)
#判断条件用于排除地毯小人
execute unless score @s carpetBot matches 1 run scoreboard players remove @s digCounter 1
execute unless score @s carpetBot matches 1 run scoreboard players remove 总挖掘量 digCounter 1
execute unless score @s carpetBot matches 1 run scoreboard players remove 总挖掘量 totalList 1
advancement revoke @s only fz:scoreboards/digcounter/toolsfix
#铲子和锄头的方块判断居然只响应产物不响应原方块，更离谱的是斧头两者会同时相应