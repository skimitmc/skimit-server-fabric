#主函数
#允许玩家操作config记分板
scoreboard players enable @a config
#每条子函数都要reset config分数和function fz:config/display
execute if data storage fz.installed {sweeper: 1b} as @a if score @s config matches 1478966200..1478966217 run function fz:sweeper/config/trigger
execute if data storage fz.installed {scoreboards: 1b} as @a if score @s config matches 1838019369..1838019379 run function fz:scoreboards/config
#循环执行本函数
schedule function fz:config/main 1t