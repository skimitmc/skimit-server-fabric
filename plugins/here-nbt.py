import nbtlib
import json

from mcdreforged.api.all import *

HIGHLIGHT_TIME = 15
PLUGIN_METADATA = {
    'id': 'herenbt',
    'version': '1.0',
    'name': 'Here-NBT',
    'description': 'here的NBT版本',
    'author': 'DancingSnow',
    'link': 'https://github.com/DancingSnow0517/',
    'dependencies': {
        'mcdreforged': '>=1.0.0'
    }
}
DimText = {
    "minecraft:overworld": {"translate": "createWorld.customize.preset.overworld"},
    "minecraft:the_nether": {"translate": "advancements.nether.root.title"},
    "minecraft:the_end": {"translate": "advancements.end.root.title"}
}
TextColor = {
    "minecraft:overworld": "§a",
    "minecraft:the_nether": "§4",
    "minecraft:the_end": "§5"
}

HerePlarer = []
UUIDS = {}
SaveStatu = False
CacheFile = 'server/usercache.json'
PlayerDataPath = 'server/world/playerdata/'


def on_load(server: ServerInterface, old):
    server.register_help_message('!!here', '广播坐标并高亮玩家')
    server.register_command(Literal('!!here').runs(Save))


def on_info(server: ServerInterface, info: Info):
    global SaveStatu
    global HerePlarer
    content = info.content
    if content == 'Saved the game':
        SaveStatu = True
        for i in HerePlarer:
            here(server, i)
            HerePlarer.remove(i)
        SaveStatu = False


def Save(source: CommandSource):
    global SaveStatu
    GetUUID()
    HerePlarer.append(source.player)
    server = source.get_server()
    if not SaveStatu:
        server.execute('save-all')


def here(server, player):
    Dim = nbtlib.load(PlayerDataPath + UUIDS[player] + '.dat')['']['Dimension']
    pos = nbtlib.load(PlayerDataPath + UUIDS[player] + '.dat')['']['Pos']
    text = ['§e{} §r@ '.format(player), TextColor[Dim], DimText[Dim],
            ' [x:{}, y:{}, z:{}]'.format(int(pos[0]), int(pos[1]), int(pos[2]))]
    server.execute('tellraw @a ' + json.dumps(text))
    if not HIGHLIGHT_TIME == 0:
        server.execute('effect give {} minecraft:glowing {} 0 true'.format(player, HIGHLIGHT_TIME))


def GetUUID():
    global UUIDS
    with open(CacheFile, 'r', encoding='UTF-8') as f:
        js = json.load(f)
        for i in js:
            UUIDS[i["name"]] = i['uuid']
