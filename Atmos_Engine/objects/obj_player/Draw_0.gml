draw_self();

#region Draw Hookshot Line 
	
	/*
	if ((state == "hookshot") && (hs_inst != noone)) {
		x_dist = x - (hs_inst.x - 16); //Get X distance between both objects 
		y_dist = y - (hs_inst.y + 16) //Get Y distance between both objects

		line_width = sprite_get_width(spr_player_hookshot); //Your chain sprite here
		line_len = abs(sqrt( sqr(x_dist) + sqr(y_dist) )); //Get the length of the entire chain.
		line_ang = degtorad(point_direction(x, y, (hs_inst.x + 16), (hs_inst.y + 16))); //get the angle of the chain and convert it from degrees to radians

		for(var i = 0; i < line_len; i += line_width) //Run a loop so we draw every chain-segment
		{
			gpu_set_tex_filter(true); 
		    draw_sprite_ext(spr_player_hookshot, 0, x + ( cos(line_ang) * i ) + ( cos(line_ang) * (line_width/2) ), (y - ( sin( line_ang ) * i )) + (sin( line_ang ) * (line_width/2) ), 1, 1, radtodeg(line_ang), c_white, 1);
			gpu_set_tex_filter(false); 
		}
	} */
	/*
	if ((state == "hookshot") && (hs_inst != noone)) {
		var dir = point_direction(x, y, obj_hs_collider.x, obj_hs_collider.y); 
		var w = sprite_get_width(spr_player_hookshot);
		var xx = lengthdir_x(w, dir), yy = lengthdir_y(w, dir);
		var count = 32 div w;
		for(var i=0; i<count; i++)
	    draw_sprite_ext(spr_player_hookshot, 0, x + xx * i, y + yy * i, 1, 1, dir, -1, 1);
	} */
	
	if ((state == "hookshot") && (hs_inst != noone)) {
		var col1 = make_color_rgb(77, 45, 32); 
		var col2 = make_color_rgb(112, 44, 17); 
		
		gpu_set_tex_filter(true); 
		draw_line_width_color(x, y, hs_inst.x, hs_inst.y, 8, col1, col2); 	
		gpu_set_tex_filter(false); 
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

#region Flickering Upon taking Damage Effect

	if (place_meeting(x, y, obj_enemy_parent)) {
		image_blend = c_black; 	
	}

	if (invis) && (invis_flicker <= 0) {
		if (image_blend == c_black) {
			image_blend = c_white;
	 	} else {
			image_blend = c_black; 	
		}
	} else if (invis_flicker >= 1) {
		invis_flicker--; 	
	}

	if (!invis) {
		image_blend = c_white; 	
	}

#endregion
