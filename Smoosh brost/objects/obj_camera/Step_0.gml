
var _p1 = instance_nearest(0, room_height/2, obj_player)
var _p2 = instance_nearest(room_width, room_height/2, obj_player)


//get target coords
var _sx = 0
var _sy = 0
var _num = instance_number(obj_player)
with obj_player {
	if ignore_me then {
		_num -= 1
		continue
	}
	_sx += x
	_sy += y
}

if _num > 0 then {
	xto = _sx/_num
	yto = _sy/_num
}

//xto += (keyboard_check(vk_right) - keyboard_check(vk_left)) * 32
//yto += (keyboard_check(vk_down) - keyboard_check(vk_up)) * 32

//go to choords
x = lerp(x, xto, lerp_spd)
y = lerp(y, yto, lerp_spd)

//get target size

if (_p1 == noone or _p2 = noone) then {
	
	lens_current = 0.5
	
} else {
	
	var _xdist = abs(_p1.x - _p2.x)
	var _ydist = abs(_p1.y - _p2.y)
	
	//lens_current = max(0.5, _xdist/SCREEN_WIDTH, _ydist/SCREEN_HEIGHT)
	lens_current = clamp(max(_xdist/SCREEN_WIDTH, _ydist/SCREEN_HEIGHT), 0.25, 1)
	lens_current += 0.1
	
}

camera_set_view_size(VIEW, SCREEN_WIDTH*lens_current, SCREEN_HEIGHT*lens_current)