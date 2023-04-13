
rollback_define_player(obj_player)

rollback_define_input({
	left: [ord("A")],
	right: [ord("D")],
	up: [ord("W")],
	down: [ord("S")],
	mx: m_axisx,
	my: m_axisy,
})



if (!rollback_join_game()) then {
	
	rollback_create_game(2, true)
	
}
