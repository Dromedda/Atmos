#region Draw Hookshot Line 

	if (state == "hookshot") && (hs_inst != noone) {
		draw_line(x, y, hs_inst.x + 16, hs_inst.y + 16); 	
	}
	
#endregion

draw_self();
