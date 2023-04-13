
//var _input = rollback_get_input()

//if is_method(state_func) then state_func()
state_func()


if y > room_height then {
	
	y = 0
	x = room_width/2
	yspd = -6
	
}


if player_local then {
	
	if keyboard_check(ord("O")) then global.timescale = 0.5
	if keyboard_check(ord("P")) then global.timescale = 1
	
	if keyboard_check(ord("K")) then global.grav_scale = 0.5
	if keyboard_check(ord("L")) then global.grav_scale = 1
	
}

/*
x += (_input.right - _input.left) * spd
y += (_input.down - _input.up) * spd