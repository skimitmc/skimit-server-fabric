#计分板数据将永久失去（真的很久！）
scoreboard objectives remove killCounter
scoreboard objectives remove digCounter
scoreboard objectives remove deathCounter
scoreboard objectives remove tradingCounter
scoreboard objectives remove fishingCounter
scoreboard objectives remove damageTaken
scoreboard objectives remove activation
scoreboard objectives remove totalList
scoreboard objectives remove bedrockBreaked
#提示已删除
tellraw @a {"text": "[信息]计分板数据已删除","color": "#5fff00"}