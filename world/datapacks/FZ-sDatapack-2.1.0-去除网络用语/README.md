# FZ-sDataPack
A Minecraft Datapack
#### @Author: Harvey_Husky

#### This project is licensed under the terms of the GNU General Public License v3.0.
#### Copyright (C)2019-2021 Harvey_Husky
### 总览
- v2.1.x支持Minecraft1.17+
- v2.0.x支持Minecraft1.16.3-1.16.5
- 抬头并按一下shift来打开设置界面
- 提供一些地毯脚本：*请在升级数据包的同时替换这些工具！！*
	- 安装方法：
		- 需要carpet mod 1.4.24+：https://github.com/gnembon/fabric-carpet/releases
		- 将其放入“world/scripts”中(在客户端位于“.minecraft/saves/存档名/scripts”或“.minecraft/config/carpet/scripts”)
	- here.sc：
		- “/here”向所有人发送自己的位置和所在维度
			- 发送的消息使用voxelmap可识别的数组格式
			- 安装voxelmap mod后，左键高亮该坐标，ctrl+左键新建坐标点
	- c.sc
		- “/c”修改玩家模式为旁观模式
	- s.sc
		- “/s”修改玩家模式为生存模式
	- tagplayer.sc：
		- 这个工具可以防止将地毯mod生成的假人计入记分板
		- 可以通过自定义文件名来自定义游戏内命令
        - 配置文件：
            - “allow_bot_tp”：用于控制是否允许tp假人
            - “allow_spawning_whitelist_players”：用于控制是否允许生成白名单内的玩家
		- 使用方法：
			- 输入“/script load tagplayer”加载工具
			- 包含全部地毯假人自带的功能，以及新功能，如：
				- “/tagplayer check xxx”：检查玩家的状态
				- “/tagplayer checkall”：检查所有玩家的状态
				- “/tagplayer killall”：清除所有假人
				- 其他用法可以在游戏内输入“/tagplayer”查看
	- restore_scores.sc：
		- 从数据包1.4升级时也需要使用这个工具
		- 这个工具可以从白名单读取玩家列表，逐一召唤假人，读取统计信息并赋值给记分板
			- 悄悄说一句没白名单的服把usercache.json复制一份改成whitelist.json就可以啦
		- *注意：原有的记分板会被删除*
		- 使用方法：
			- 输入“/script load restore_scores”加载工具
			- 输入“/restore_scores by_whitelist”开始恢复
			- 输入“/script unload restore_scores”卸载工具
			- 记得用完就删掉它！
- 无需配置即可支持该铁头功破基岩榜Mod：https://gitee.com/harvey-husky/FZ-BBL/releases
	- 破基岩榜的分数和订阅设置会在铁头功记分板的总分大于0时显示，以免未添加该mod的服务器显示破基岩榜
##### v2.1.0
- 仅支持1.17+
- 修复使用部分工具和方块交互时挖掘榜会减分的bug
- 为榜单恢复插件新增新版本的新方块
##### v2.0.8
- 修复在末地使用/here时，世界名称显示为世界id的bug
- 修复tagplayer可以随意传送玩家的bug
- 修复记分板轮播时不显示击杀榜的bug
- 修复没有破基岩榜时依然会轮播破基岩榜的bug
- 为/tagplayer tp指令添加了配置文件
##### v2.0.3
- 修复在不添加tagplayer工具时记分板不加分的bug
##### v2.0.2
- 修复在使用carpet-1.4.22或以上版本时，tagplayer的玩家名错乱的bug
##### v2.0.1.8
- 修复使用金斧头挖掘会导致总量+2的bug
- 修复使用金锄头挖掘不会给挖掘榜加分
- 修复主手有铲子，斧头，锄头时，副手放置方块会导致挖掘榜-1的bug(原版bug，通过toolsfix2成就修复)
##### v2.0.1.7
- 修复有时设置界面打不开的bug
- 修复交易榜只加一次分的bug..
- 修复tagplayer中的事件多次触发的bug
##### v2.0.1.6
- tagplayer现在可以通过自定义文件名来自定义游戏内命令
- 修复铁制工具依然不统计记分板的bug...
##### v2.0.1.3
- 修复部分铁质工具不统计挖掘榜的bug
##### v2.0.1.1
- 为设置界面的计分板添加悬浮文本
- 无需配置即可支持该铁头功破基岩榜Mod：https://gitee.com/harvey-husky/FZ-BBL/releases
	- 破基岩榜的分数和订阅设置会在铁头功记分板的总分大于0时显示，以免未添加该mod的服务器显示破基岩榜
##### v2.0.0.11
- “/tagplayer spawn xxx”后面现在可以追加“at”、“facing”、“in”参数
##### v2.0.0.10
- 扫地机添加了位于怪物血条栏的文字提示，同时添加了各种提示的开关功能
##### v2.0.0.9
- 修复矿车白名单状态反了的bug
##### v2.0.0.8
- 添加c.sc、s.sc、here.sc工具
##### v2.0.0.7
- tagplayer添加了新版carpet新指令，可以为假人切换热键栏
- 现在tagplayer需要carpet1.4.21或以上版本运行！
- 现在tagplayer可以给自己设置动作了
- 添加“/tagplayer shadow”指令将自己变为前缀为“挂机”的假人
##### v2.0.0.6
- 修复restore_scores.sc工具不能恢复受伤害榜(抖M榜)的bug
##### v2.0.0.5
- 修复挖掘榜部分工具不起作用的bug
- 添加restore_scores.sc工具便于恢复或从1.0版本升级记分板
##### v2.0.0.4
- 添加彩色字体
##### v2.0.0.3
- tagplayer需要地毯mod1.4.18或以上版本来运行
- 优化了tagplayer体验及修复若干bug
##### v2.0.0.2
- 重写
