#region Key Goto

	var key_goto = keyboard_check_pressed(ord("E")); 

#endregion


#region Goto Room

	if (key_goto) {
		if (place_meeting(x, y, obj_player)) {
			room_goto(goto_room); 	
		}
	}

#endregion