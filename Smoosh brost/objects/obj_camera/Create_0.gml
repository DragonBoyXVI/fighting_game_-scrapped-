if instance_number(object_index) > 1 then {
	instance_destroy()
	exit
}

#region define camera data

lens_current = 1
view_buffer = 128

lerp_spd = 0.5

xto = 0
yto = 0

#endregion define camera data

event_perform(ev_other, ev_room_start)
