
//var _input = rollback_get_input()

//if is_method(state_func) then state_func()
state_func()


if y > room_height then {
	
	y = 0
	x = room_width/2
	yspd = -6
	
}

/*
if player_local then {
	global.timescale += (keyboard_check(ord("P")) - keyboard_check(ord("O")))/10
	global.grav_scale += (keyboard_check(ord("K")) - keyboard_check(ord("L")))/10
}

/*
x += (_input.right - _input.left) * spd
y += (_input.down - _input.up) * spd