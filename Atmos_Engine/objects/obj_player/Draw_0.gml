#region Draw Hookshot Line 

	if (state == "hookshot") && (hs_inst != noone) {
		draw_line(x, y, hs_inst.x, hs_inst.y); 	
	}
	
#endregion

draw_self();
