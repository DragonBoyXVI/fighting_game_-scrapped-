



/*old
//helpers
function fun_check_collision_below(_dist, _tiles = true, _objects = true) {
	
	var _array = [false, false, false] //is collison, is tile, is object
	
	var _bbox_bottom_true = bbox_bottom + _dist
	
	if (_tiles and wall_elem != -1) then {
		
		if (tilemap_get_at_pixel(wall_elem, x, _bbox_bottom_true) == 1 //center
		or tilemap_get_at_pixel(wall_elem, bbox_left, _bbox_bottom_true) == 1 //left
		or tilemap_get_at_pixel(wall_elem, bbox_right, _bbox_bottom_true) == 1) then { //right
			
			_array[0] = true
			_array[1] = true
			
		}
		
	}
	
	if (_objects) then {
		
		if (place_meeting(x, _bbox_bottom_true, obj_wall)) then {
			
			_array[0] = true
			_array[2] = true
			
		}
		
	}
	
	return _array
	
}

function fun_check_collision_above(_dist, _tiles = true, _objects = true) {
	
	var _array = [false, false, false] //is collison, is tile, is object
	
	var _bbox_top_true = bbox_top - _dist
	
	if (_tiles and wall_elem != -1) then {
		
		if (tilemap_get_at_pixel(wall_elem, x, _bbox_top_true) == 1 //center
		or tilemap_get_at_pixel(wall_elem, bbox_left, _bbox_top_true) == 1 //left
		or tilemap_get_at_pixel(wall_elem, bbox_right, _bbox_top_true) == 1) then { //right
			
			_array[0] = true
			_array[1] = true
			
		}
		
	}
	
	if (_objects) then {
		
		if (place_meeting(bbox_bottom, _bbox_top_true, obj_wall)) then {
			
			_array[0] = true
			_array[2] = true
			
		}
		
	}
	
	return _array
	
}

function fun_check_collision_right(_dist, _tiles = true, _objects = true) {
	
	var _array = [false, false, false] //is collison, is tile, is object
	
	var _bbox_right_true = bbox_right + _dist
	
	if (_tiles and wall_elem != -1) then {
		
		if (tilemap_get_at_pixel(wall_elem, _bbox_right_true, bbox_bottom+bbox_height/2) == 1 //center
		or tilemap_get_at_pixel(wall_elem, _bbox_right_true, bbox_bottom-1) == 1 //bottom
		or tilemap_get_at_pixel(wall_elem, _bbox_right_true, bbox_top) == 1) then { //top
			
			_array[0] = true
			_array[1] = true
			
		}
		
	}
	
	if (_objects) then {
		
		if (place_meeting(_bbox_right_true, y, obj_wall)) then {
			
			_array[0] = true
			_array[2] = true
			
		}
		
	}
	
	return _array
	
}

function fun_check_collision_left(_dist, _tiles = true, _objects = true) {
	
	var _array = [false, false, false] //is collison, is tile, is object
	
	var _bbox_left_true = bbox_left - _dist
	
	if (_tiles and wall_elem != -1) then {
		
		if (tilemap_get_at_pixel(wall_elem, _bbox_left_true, bbox_bottom+bbox_height/2) == 1 //center
		or tilemap_get_at_pixel(wall_elem, _bbox_left_true, bbox_bottom-1) == 1 //bottom
		or tilemap_get_at_pixel(wall_elem, _bbox_left_true, bbox_top) == 1) then { //top
			
			_array[0] = true
			_array[1] = true
			
		}
		
	}
	
	if (_objects) then {
		
		if (place_meeting(_bbox_left_true, y, obj_wall)) then {
			
			_array[0] = true
			_array[2] = true
			
		}
		
	}
	
	return _array
	
}

//actual states
function fun_state_in_play_on_ground() {
	
	var _input = rollback_get_input()
	
	var _spd = round((_input.right - _input.left) * spd)
	
	if _spd > 0 then {
		while(fun_check_collision_right(_spd)[0]) {
			_spd--
		}
	} else if _spd < 0 then {
		while(fun_check_collision_left(-_spd)[0]) {
			_spd++
		}
	}
	
	x += _spd
	if (_input.up) then {
		hspd = _spd
		vspd = -jump_speed
		y -= 4
		state_func = fun_state_in_play_in_air
		state_changes++
		exit
	}
	
	var _floor = fun_check_collision_below(1)
	
	if (not _floor[0]) then {
		state_func = fun_state_in_play_in_air
		state_changes++
	}
	
}

function fun_state_in_play_in_air() {
	
	var _input = rollback_get_input()
	
	var _dir_pressed = (_input.right - _input.left)
	
	hspd = clamp(hspd + (spd * air_control * 5), -spd, spd)
	
	if hspd > 0 then {
		while(fun_check_collision_right(hspd)[0]){
			hspd--
		}
	} else if hspd < 0 then {
		while(fun_check_collision_left(-hspd)[0]){
			hspd++
		}
	}
	x += hspd
	vspd = min(terminal_speed, vspd + weight/32)
	var _floor = -1
	if vspd > 0 then { //going down
		
		repeat(vspd){
			
			_floor = fun_check_collision_below(1)
			if _floor[0] then {//stop falling
				
				state_func = fun_state_in_play_on_ground
				state_changes++
				vspd = 0
				hspd = 0
				
			} else {
				y++
			}
			
		}
		
	} else if vspd < 0 then { //goin wupwards
		
		repeat(-vspd){
			
			_floor = fun_check_collision_above(1)
			if _floor[0] then {//stop rising
				
				vspd = 0
				
			} else {
				y--
			}
			
		}
		
	}
	
}