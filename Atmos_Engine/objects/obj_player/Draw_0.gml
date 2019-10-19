draw_self();

#region Draw Hookshot Line 

	if ((state == "hookshot") && (hs_inst != noone)) {
		// This chain will be cast/drawn from object1!
		x_dist = x - (hs_inst.x + 16); //Get X distance between both objects 
		y_dist = y - (hs_inst.y + 16); //Get Y distance between both objects

		line_width = sprite_get_width(spr_player_hookshot); //Your chain sprite here
		line_len = abs(sqrt( sqr(x_dist) + sqr(y_dist) )); //Get the length of the entire chain.
		line_ang = degtorad(point_direction(x, y, (hs_inst.x + 16), (hs_inst.y + 16))); //get the angle of the chain and convert it from degrees to radians

		for(var i = 0; i < line_len; i += line_width) //Run a loop so we draw every chain-segment
		{
			gpu_set_tex_filter(true); 
		    draw_sprite_ext(spr_player_hookshot, 0, x + ( cos(line_ang) * i ) + ( cos(line_ang) * (line_width/2) ), (y - ( sin( line_ang ) * i )) + (sin( line_ang ) * (line_width/2) ), 1, 1, radtodeg(line_ang), c_white, 1);
			gpu_set_tex_filter(false); 
		}
	}
	
#endregion

#region Sprinting

	if (sprinting) {
		if (facing_dir == -1) {
			scr_image_blur(16, 0); 		
		} else {
			scr_image_blur(16, 180); 	
		}
	}

#endregion
