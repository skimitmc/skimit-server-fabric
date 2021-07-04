scoreboard objectives add carpetBot dummy
#在线时间计数器记分板，用于activation/main函数
scoreboard objectives add actimeCounter dummy

scoreboard objectives add killCounter dummy
scoreboard objectives add digCounter dummy
    scoreboard objectives add usedDiaAxe minecraft.used:minecraft.diamond_axe
    scoreboard objectives add usedDiaPickaxe minecraft.used:minecraft.diamond_pickaxe
    scoreboard objectives add usedDiaShovel minecraft.used:minecraft.diamond_shovel
    scoreboard objectives add usedDiaHoe minecraft.used:minecraft.diamond_hoe
    scoreboard objectives add usedIroAxe minecraft.used:minecraft.iron_axe
    scoreboard objectives add usedIroPickaxe minecraft.used:minecraft.iron_pickaxe
    scoreboard objectives add usedIroShovel minecraft.used:minecraft.iron_shovel
    scoreboard objectives add usedIroHoe minecraft.used:minecraft.iron_hoe
    scoreboard objectives add usedStoAxe minecraft.used:minecraft.stone_axe
    scoreboard objectives add usedStoPickaxe minecraft.used:minecraft.stone_pickaxe
    scoreboard objectives add usedStoShovel minecraft.used:minecraft.stone_shovel
    scoreboard objectives add usedStoHoe minecraft.used:minecraft.stone_hoe
    scoreboard objectives add usedWooAxe minecraft.used:minecraft.wooden_axe
    scoreboard objectives add usedWooPickaxe minecraft.used:minecraft.wooden_pickaxe
    scoreboard objectives add usedWooShovel minecraft.used:minecraft.wooden_shovel
    scoreboard objectives add usedWooHoe minecraft.used:minecraft.wooden_hoe
    scoreboard objectives add usedGolAxe minecraft.used:minecraft.golden_axe
    scoreboard objectives add usedGolPickaxe minecraft.used:minecraft.golden_pickaxe
    scoreboard objectives add usedGolShovel minecraft.used:minecraft.golden_shovel
    scoreboard objectives add usedGolHoe minecraft.used:minecraft.golden_hoe
    scoreboard objectives add usedNetAxe minecraft.used:minecraft.netherite_axe
    scoreboard objectives add usedNetPickaxe minecraft.used:minecraft.netherite_pickaxe
    scoreboard objectives add usedNetShovel minecraft.used:minecraft.netherite_shovel
    scoreboard objectives add usedNetHoe minecraft.used:minecraft.netherite_hoe
    scoreboard objectives add usedShears minecraft.used:minecraft.shears
scoreboard objectives add deathCounter dummy
    scoreboard objectives add deathTester deathCount
scoreboard objectives add tradingCounter dummy
scoreboard objectives add fishingCounter dummy
    scoreboard objectives add fishingTester minecraft.custom:fish_caught
scoreboard objectives add damageTaken dummy
    scoreboard objectives add 10xDamageTaken minecraft.custom:damage_taken
scoreboard objectives add activation dummy
scoreboard objectives add totalList dummy
scoreboard objectives add bedrockBreaked dummy
scoreboard objectives add fz.bbl dummy

scoreboard objectives modify activation displayname {"text": "活跃时间(h)","color": "aqua"}
scoreboard objectives modify damageTaken displayname {"text": "受伤害榜","color": "yellow"}
scoreboard objectives modify deathCounter displayname {"text": "死亡榜","color": "dark_red"}
scoreboard objectives modify digCounter displayname {"text": "挖掘榜","color": "gray"}
scoreboard objectives modify fishingCounter displayname {"text": "钓鱼榜","color": "blue"}
scoreboard objectives modify killCounter displayname {"text": "击杀榜","color": "red"}
scoreboard objectives modify tradingCounter displayname {"text": "交易榜","color": "green"}
scoreboard objectives modify totalList displayname {"text": "总 量","color": "dark_aqua"}
scoreboard objectives modify bedrockBreaked displayname {"text": "破基岩榜","color": "dark_green"}

team add gold
team add aqua
team add yellow
team add dark_red
team add gray
team add blue
team add red
team add green
team add dark_aqua
team add dark_green
team modify gold color gold
team modify aqua color aqua
team modify yellow color yellow
team modify dark_red color dark_red
team modify gray color gray
team modify blue color blue
team modify red color red
team modify dark_aqua color dark_aqua
team modify green color green
team modify dark_green color dark_green

team join aqua 总在线时间(h)
team join yellow 总受伤害量
team join dark_red 总死亡数
team join gray 总挖掘量
team join blue 总钓鱼数
team join red 总击杀数
team join green 总交易数
team join dark_green 总破基岩数
#各计分板的总量
scoreboard players operation 总在线时间(h) activation = 总在线时间(h) activation
scoreboard players operation 总受伤害量 damageTaken = 总受伤害量 damageTaken
scoreboard players operation 总死亡数 deathCounter = 总死亡数 deathCounter
scoreboard players operation 总挖掘量 digCounter = 总挖掘量 digCounter
scoreboard players operation 总钓鱼数 fishingCounter = 总钓鱼数 fishingCounter
scoreboard players operation 总击杀数 killCounter = 总击杀数 killCounter
scoreboard players operation 总交易数 tradingCounter = 总交易数 tradingCounter
#总榜的总量
scoreboard players operation 总在线时间(h) totalList = 总在线时间(h) totalList
scoreboard players operation 总受伤害量 totalList = 总受伤害量 totalList
scoreboard players operation 总死亡数 totalList = 总死亡数 totalList
scoreboard players operation 总挖掘量 totalList = 总挖掘量 totalList
scoreboard players operation 总钓鱼数 totalList = 总钓鱼数 totalList
scoreboard players operation 总击杀数 totalList = 总击杀数 totalList
scoreboard players operation 总交易数 totalList = 总交易数 totalList

scoreboard objectives setdisplay sidebar.team.aqua activation
scoreboard objectives setdisplay sidebar.team.yellow damageTaken
scoreboard objectives setdisplay sidebar.team.dark_red deathCounter
scoreboard objectives setdisplay sidebar.team.gray digCounter
scoreboard objectives setdisplay sidebar.team.blue fishingCounter
scoreboard objectives setdisplay sidebar.team.red killCounter
scoreboard objectives setdisplay sidebar.team.dark_aqua totalList
scoreboard objectives setdisplay sidebar.team.green tradingCounter
scoreboard objectives setdisplay sidebar.team.dark_green bedrockBreaked

data merge storage fz.installed {scoreboards:1b}

#提示已安装
tellraw @a {"text": "[信息]记分板已安装","color": "#5fff00"}
function fz:scoreboards/start