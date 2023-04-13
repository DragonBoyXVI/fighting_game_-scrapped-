//x = random_range(0, room_width)
//y = random_range(0, room_height)

is_ai = false

if player_id == 0 then {
	x = 500
	y = 64
} else {
	x = room_width - 500
	y = 64
	is_ai = true
}

my_ai = -1

ignore_me = false

state = P_STATE.IN_PLAY
state_func = fun_state_in_play_on_ground  //-1

spd = 6
air_control = 0.01

hspd = 0
vspd = 0

weight = 68 //kg
terminal_speed = 100

#region wall tile layer

var _layer = -1
if layer_exists("Walls") then _layer = layer_get_id("Walls")
else if layer_exists("Wall") then _layer = layer_get_id("Wall")
else if layer_exists("walls") then _layer = layer_get_id("walls")
else if layer_exists("wall") then _layer = layer_get_id("wall")

wall_elem = -1
if _layer != -1 then wall_elem = layer_tilemap_get_id(_layer)

#endregion wall tile layer
#region bounding box

bbox_width = bbox_right - bbox_left
bbox_height = bbox_bottom - bbox_top

#endregion bounding box