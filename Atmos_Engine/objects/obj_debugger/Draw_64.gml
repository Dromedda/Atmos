#region Draw Options

	if (active) {
		draw_set_font(fnt_tooltip); 
		draw_text(16, 16, "Room: " + string(room)); 
		draw_text(16, 32, "shift + Arrow Keys = Change Room"); 	
	} else {
		draw_set_font(fnt_tooltip); 
		draw_text(16, 16, "F2 to open Debugger"); 
	}

#endregion