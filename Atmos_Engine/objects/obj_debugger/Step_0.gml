#region Init Debugger

	var key_init_debugger = keyboard_check_pressed(vk_f2); 

	if (key_init_debugger) {
		active = !active; 
	}

#endregion

#region Debugger Active 

	if (active) {
		
		//TP to different Rooms
		var key_room_goto = keyboard_check(vk_lshift); 
		var key_room_next = keyboard_check_pressed(vk_right); 
		var key_room_prev = keyboard_check_pressed(vk_left); 
		
		var key_noclip = keyboard_check_pressed(ord("N")); 
		
		if (key_room_goto) {
			if (key_room_next) {
				if (room != room_last) {
					room_goto_next(); 
				}
			} else if (key_room_prev) {
				if (room != room_first) {
					room_goto_previous();
				}
			}
		}
		
		//Noclip Mode For Player
		if (key_noclip) {
			noclip = !noclip; 			
		}
		
	}

#endregion