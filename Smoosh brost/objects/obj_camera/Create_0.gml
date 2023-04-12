if instance_number(object_index) > 1 then {
	instance_destroy()
	exit
}

#region define camera data

lens_current = 1
view_buffer = 128

lerp_spd = 0.75

xto = 0
yto = 0

#endregion define camera data

event_perform(ev_other, ev_room_start)

rollback_define_player(obj_player)

if (!rollback_join_game()) then {
	
	rollback_create_game(2, true)
	
}