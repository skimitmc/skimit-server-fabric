import json
import os
import time

config = {}

class fzsDatapackImporter():
    def loadJson(self, filePath):
        with open(filePath, "r") as f:
            return json.load(f)

    def saveJson(self, filePath, configObject):
        with open(filePath, "w") as f:
            json.dump(configObject, f, ensure_ascii = False, indent = 4)
    
    def saveDefaultConfig(self):
        defaultConfig = {
            "global": {
                "commandPrefix": "!!fdi",
                "mode": "whitelist",
                "serverPath": "/server",
                "worldName": "world"
            },
            "commandPermissions": {
                "help": 0,
                "refresh": 3,
                "process": 3,
            }
        }
        self.saveJson("./plugins/{}/config.json".format(self.getSelfName()), defaultConfig)

    def getSelfName(self):
        return os.path.basename(__file__).replace(".py", "")

    def getPlayerStatsData(self, uuid, classification, target):
        config = self.loadJson("./plugins/{}/config.json".format(self.getSelfName()))
        uuidFilePath = ".{}/{}/stats/{}.json".format(config["global"]["serverPath"], config["global"]["worldName"], uuid)
        if (os.path.isfile(uuidFilePath)):
            data = self.loadJson(uuidFilePath)
            if ("minecraft:{}".format(classification) in data["stats"]):
                if ("minecraft:{}".format(target) in data["stats"]["minecraft:{}".format(classification)]):
                    return data["stats"]["minecraft:{}".format(classification)]["minecraft:{}".format(target)]
        return None

    def refreshUUID(self):
        config = self.loadJson("./plugins/{}/config.json".format(self.getSelfName()))
        for i in {"usercache", "whitelist"}:
            t = self.loadJson(".{}/{}.json".format(config["global"]["serverPath"], i))
            r = {}
            for k in t: 
                r[k["name"]] =  k["uuid"]
            self.saveJson("./plugins/{}/uuid/{}.json".format(self.getSelfName(), i), r)
    
    def checkConfig(self):
        if (not os.path.isdir("./plugins/{}".format(self.getSelfName()))):
            os.makedirs("./plugins/{}/uuid".format(self.getSelfName()))
        if (not os.path.isfile("./plugins/{}/config.json".format(self.getSelfName()))):
            self.saveDefaultConfig()
        self.refreshUUID()

    def loadUUID(self):
        config = self.loadJson("./plugins/{}/config.json".format(self.getSelfName()))
        if (config["global"]["mode"] in {"usercache", "whitelist"}):
            t = self.loadJson("./plugins/{}/uuid/{}.json".format(self.getSelfName(), config["global"]["mode"]))
            return t 
        else:
            return None

    def __sync(self, server, classification, targetList, scoreboardOjbect, totalScoreName, isAct = False, isDamage = False):
        r = self.loadUUID()
        if (r):
            total = 0
            for i in r:
                data = 0
                for k in targetList:
                    if(self.getPlayerStatsData(r[i], classification, k)):
                        data += self.getPlayerStatsData(r[i], classification, k)
                if (isAct):
                    server.execute("scoreboard players set {} {} {}".format(i, "actimeCounter", data % 72000))
                    server.execute("scoreboard players set {} {} {}".format(i, "activation", data // 72000))
                    total = total + data // 72000
                elif (isDamage):
                    server.execute("scoreboard players set {} {} {}".format(i, "damageTaken", data // 10))
                    total = total + data // 10
                else:
                    server.execute("scoreboard players set {} {} {}".format(i, scoreboardOjbect, data))
                    total = total + data
                    
            server.execute("scoreboard players set {} {} {}".format(totalScoreName, "totalList", total))
            server.execute("scoreboard players set {} {} {}".format(totalScoreName, scoreboardOjbect, total))
            return True
        else:
            return False
            
    def syncActCounter(self, server):
        return self.__sync(server, "custom", {"play_one_minute"}, "activation", "总在线时间(h)", True, False)
        
    def syncDamageTaken(self, server):
        return self.__sync(server, "custom", {"damage_taken"}, "damageTaken", "总受伤害量", False, True)
        
    def syncDeathCounter(self, server):
        return self.__sync(server, "custom", {"deaths"}, "deathCounter", "总死亡数")
        
    def syncDigCounter(self, server):
        return self.__sync(server, "used", {"diamond_axe", "diamond_pickaxe", "diamond_shovel", "diamond_hoe", "iron_axe", "iron_axe", "iron_axe", "iron_axe", "stone_axe", "stone_pickaxe", "stone_shovel", "stone_hoe", "wooden_axe", "wooden_pickaxe", "wooden_shovel", "wooden_hoe", "golden_axe", "golden_pickaxe", "golden_shovel", "golden_hoe", "netherite_axe", "netherite_pickaxe", "netherite_shovel", "netherite_hoe", "shears" }, "digCounter", "总挖掘量")
        
    def syncFishingCounter(self, server):
        return self.__sync(server, "custom", {"fish_caught"}, "fishingCounter", "总钓鱼数")
        
    def syncKillCounter(self, server):
        return self.__sync(server, "custom", {"mob_kills', 'player_kills"}, "killCounter", "总击杀数")
        
    def syncTradingCounter(self, server):
        return self.__sync(server, "custom", {"traded_with_villager"}, "tradingCounter", "总交易数")
        
def on_info(server, info):
    p = fzsDatapackImporter()
    p.checkConfig()
    config = p.loadJson("./plugins/{}/config.json".format(p.getSelfName()))
    args = info.content.split(" ")
    arglen = len(args)
    if (args[0] == config["global"]["commandPrefix"]):
        if (arglen > 1 and args[1] in config["commandPermissions"]):
            if (server.get_permission_level(info) < config["commandPermissions"][args[1]]):
                server.reply(info, "§aFDI §7>> §c你没有使用该命令的权限!")
                return
            elif (args[1] == "help" and arglen == 2):
                server.reply(info, "§a{} help §7- §e获取帮助".format(config["global"]["commandPrefix"]))
                server.reply(info, "§a{} refresh §7- §e刷新uuid缓存".format(config["global"]["commandPrefix"]))
                server.reply(info, "§a{} process [榜单] §7- §e执行同步".format(config["global"]["commandPrefix"]))
                
            elif (args[1] == "refresh" and arglen == 2):
                p.refreshUUID()
                server.reply(info, "§aFDI §7>> §bUUID缓存刷新完成!")
            elif (args[1] == "process" and arglen >= 2 and arglen <= 3):
                if((arglen == 3 and args[2] == "activation") or arglen == 2):
                    if (p.syncActCounter(server)):
                        server.reply(info, "§aFDI §7>> §b活跃时间(h)同步完成!")
                    else:
                        server.reply(info, "§aFDI §7>> §c活跃时间(h)同步失败!")
                    time.sleep(1)
                    
                if((arglen == 3 and args[2] == "damage") or arglen == 2):
                    if (p.syncDamageTaken(server)):
                        server.reply(info, "§aFDI §7>> §b受伤害名单同步完成!")
                    else:
                        server.reply(info, "§aFDI §7>> §c受伤害名单同步失败!")
                    time.sleep(1)
                if((arglen == 3 and args[2] == "death") or arglen == 2):
                    if (p.syncDeathCounter(server)):
                        server.reply(info, "§aFDI §7>> §b死亡榜同步完成!")
                    else:
                        server.reply(info, "§aFDI §7>> §c死亡榜同步失败!")
                    time.sleep(1)
                if((arglen == 3 and args[2] == "dig") or arglen == 2):
                    if (p.syncDigCounter(server)):
                        server.reply(info, "§aFDI §7>> §b挖掘榜同步完成!")
                    else:
                        server.reply(info, "§aFDI §7>> §c挖掘榜同步失败!")
                if((arglen == 3 and args[2] == "fishing") or arglen == 2):
                    if (p.syncFishingCounter(server)):
                        server.reply(info, "§aFDI §7>> §b钓鱼榜同步完成!")
                    else:
                        server.reply(info, "§aFDI §7>> §c钓鱼榜同步失败!")
                    time.sleep(1)
                if((arglen == 3 and args[2] == "kill") or arglen == 2):
                    if (p.syncKillCounter(server)):
                        server.reply(info, "§aFDI §7>> §b击杀榜同步完成!")
                    else:
                        server.reply(info, "§aFDI §7>> §c击杀榜同步失败!")
                    time.sleep(1)
                if((arglen == 3 and args[2] == "trading") or arglen == 2):
                    if (p.syncTradingCounter(server)):
                        server.reply(info, "§aFDI §7>> §b交易榜同步完成!")
                    else:
                        server.reply(info, "§aFDI §7>> §c交易榜同步失败!")
                    time.sleep(1)
        else:
            server.reply(info, "§aFDI §7>> §b未知指令, 请输入 !!fdi help 来获取帮助!")
        return


def on_load(server, old_module):
    fzsDatapackImporter().checkConfig()
    server.add_help_message("!!fdi help", "哈尔威数据包计分榜数据同步")
