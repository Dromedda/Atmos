#region INPUT PROGRESS KEY

	var key_progress = (keyboard_check_pressed(ord("E"))); 

#endregion

#region Flip Page

	if (key_progress) {
		if ((char_count) < string_length(text_to_draw[page])) {
			char_count = string_length(text_to_draw[page]); 	
		} else if ((page + 1) < array_length_1d(text_to_draw)) {
			page += 1; 
			char_count = 0; 
		} else {
			instance_destroy(); 
			creator.alarm[0] = 10;	
		}
	}

#endregion

#region Fancy text writing

	if (char_count < string_length(text_to_draw[page])) {
		char_count += (writing_speed/10); 	
	}
	
#endregion
