#region Draw "Tooltips" 

	draw_set_font(fnt_tooltip); 

	var row_spacing = 8; 

	if ((keyboard_check(vk_alt)) && (!keyboard_check(vk_lcontrol))) {
		draw_text(8, row_spacing, "GAME DEBUGGER"); 
		draw_text(8, (row_spacing * 2),  "0 = GOTO TEST LEVEL"); 
		draw_text(8, (row_spacing * 3), "1 = GOTO HUB");  
		draw_text(8, (row_spacing * 4), "R = RESTART ROOM");
		draw_text(8, (row_spacing * 5), "CTRL = MORE"); 
	}

	if ((keyboard_check(vk_lcontrol)) && (keyboard_check(vk_alt))) {
		draw_text(8, row_spacing, "GAME DEBUGGER"); 
		draw_text(8, (row_spacing * 2), "R = GAME RESTART"); 
	}

#endregion