#安装血量显示
#初始化
scoreboard objectives add Health health {"text": "HP"}
scoreboard objectives modify Health rendertype hearts
scoreboard objectives setdisplay list Health
scoreboard objectives setdisplay belowName Health
#写入已安装的信息
data merge storage fz.installed {health: 1b}
#提示已安装
tellraw @a {"text": "[信息]血量显示已安装","color": "#5fff00"}