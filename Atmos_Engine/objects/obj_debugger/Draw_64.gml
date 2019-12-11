#region Draw Options

	if (active) {
		draw_set_font(fnt_tooltip); 
		draw_text(16, 16, "Room: " + string(room)); 
		draw_text(16, 32, "shift + Arrow Keys = Change Room"); 	
		draw_text(16, 48, "N = Noclip Mode"); 
	} else {
		draw_set_font(fnt_tooltip); 
		draw_text(16, 16, "F2 to open Debugger"); 
	}
	
	if (noclip == true) {
		draw_set_font(fnt_text_box_standard); 
		draw_text(view_get_wport(0)/2 - 96, view_get_hport(0)/2, "NOCLIP MODE ACTIVE"); 	
	}

#endregion