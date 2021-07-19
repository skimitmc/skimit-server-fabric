#初始化tagplayer
carpet setDefault commandScript true
carpet setDefault commandScriptACE ops
script run carpet_rules = system_info('world_carpet_rules'); if(carpet_rules:'scriptsAutoload' != 'true', run('carpet setDefault scriptsAutoload true'); run('tellraw @a {"text":"[错误]假人插件未正确加载，已自动将“scriptsAutoload”设为true。正在重载，如仍未加载，请手动加载...", "color":"#ff6100"}'); run('reload'))
script unload player
