  #region Hotkeys

	if (keyboard_check(vk_alt)) {
		if (keyboard_check_pressed(ord("1"))) {
			room_goto(1); 	
		}
		if (keyboard_check_pressed(ord("0"))) {
			room_goto(0);	
		}
		if (keyboard_check_pressed(ord("R"))) {
			room_restart(); 	
		}
		if (keyboard_check(vk_shift)) {
			if (keyboard_check_pressed(ord("R"))) {
				game_restart(); 	
			}
		}
	}

#endregion