__config() -> {
	'stay_loaded' -> true
};
__command() -> (
	s_player = player();
	pos = query(s_player, 'pos');
	dim = query(s_player, 'dimension');
	if(dim == 'overworld',
		(
			run(str('tellraw @a [{"selector": "@s"},{"text":"说: 我在主世界[x:%d, y:%d, z:%d, dim:overworld]","color": "aqua"}]',
				round(pos:0), round(pos:1), round(pos:2)
			));
			run(str('tellraw @a [{"text":"- 对应地狱: [x:%d, y:128, z:%d, dim:the_nether]","color": "aqua"}]',
				round((pos:0)/8), round((pos:2)/8)
			))
		),
		dim == 'the_nether',
		(
			run(str('tellraw @a [{"selector": "@s"},{"text":"说: 我在下界[x:%d, y:%d, z:%d, dim:the_nether]","color": "aqua"}]',
				round(pos:0), round(pos:1), round(pos:2)
			));
			run(str('tellraw @a [{"text":"- 对应主世界: [x:%d, y:64, z:%d, dim:overworld]","color": "aqua"}]',
				round((pos:0)*8), round((pos:2)*8)
			))
		),
		dim == 'the_end',
		(
		run(str('tellraw @a [{"selector": "@s"},{"text":"说: 我在末地[x:%d, y:%d, z:%d, dim:%s]","color": "aqua"}]',
			round(pos:0), round(pos:1), round(pos:2), dim
		))
		),
		run(str('tellraw @a [{"selector": "@s"},{"text":"说: 我在%s世界[x:%d, y:%d, z:%d, dim:%s]","color": "aqua"}]',
			dim, round(pos:0), round(pos:1), round(pos:2), dim
		))
	);
	exit()
)