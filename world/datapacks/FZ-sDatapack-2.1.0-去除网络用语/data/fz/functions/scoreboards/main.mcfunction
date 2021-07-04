function fz:scoreboards/killcounter/setdisplay
schedule function fz:scoreboards/deathcounter/setdisplay 10s replace
schedule function fz:scoreboards/digcounter/setdisplay 20s replace
schedule function fz:scoreboards/tradingcounter/setdisplay 30s replace
schedule function fz:scoreboards/fishingcounter/setdisplay 40s replace
schedule function fz:scoreboards/damagetaken/setdisplay 50s replace
schedule function fz:scoreboards/activation/setdisplay 60s replace
schedule function fz:scoreboards/totallist 70s replace
execute if score 总破基岩数 bedrockBreaked matches 1.. run schedule function fz:scoreboards/bedrockbreaked/setdisplay 80s replace
execute if score 总破基岩数 bedrockBreaked matches 1.. run schedule function fz:scoreboards/main 90s replace
execute unless score 总破基岩数 bedrockBreaked matches 1.. run schedule function fz:scoreboards/main 80s replace