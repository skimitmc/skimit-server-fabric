#为digtrigger函数修正非挖掘的使用带来的加分(使用工具攻击实体)
#判断条件用于排除地毯小人
execute unless score @s carpetBot matches 1 run scoreboard players remove @s digCounter 1
execute unless score @s carpetBot matches 1 run scoreboard players remove 总挖掘量 digCounter 1
execute unless score @s carpetBot matches 1 run scoreboard players remove 总挖掘量 totalList 1
advancement revoke @s only fz:scoreboards/digcounter/toolsfix2