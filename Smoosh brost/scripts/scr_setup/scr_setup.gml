
var _example_player = {
	object: noone, //id
	stocks: 3,
	kills: 3,
	points: 3,
}

global.player_data = array_create(4, -1)

global.timescale = 1
global.grav_spd = 1
global.grav_scale = 1

global.settings = -1

display_set_gui_size(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)