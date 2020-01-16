draw_self();

#region Draw Hookshot Line 
	
	if ((state == "hookshot") && (hs_inst != noone)) {
		var x_dist = obj_player.x - obj_hs_collider.x; 
		var y_dist = obj_player.y - obj_hs_collider.y; 
	
		hs_width = sprite_get_width(spr_hs_text); //Your hs sprite here
		hs_length = (abs(sqrt( sqr(x_dist) + sqr(y_dist) )) + 1); //Get the length of the entire hs.
		hs_angle = degtorad(point_direction(obj_player.x, obj_player.y + 16, obj_hs_collider.x, obj_hs_collider.y)); //get the angle of the hs and convert it from degrees to radian.

		for(var i = 0; i < hs_length; i += hs_width) //Run a loop so we draw every hs-segment
		{
		     // This is the big one. We draw the hs segment at the proper rotated angle, with an x-coordinate multiplied by cos(hsAngle), and a y-coordinate multiplied by sin(hsAngle).
		     // They're both multiplied by cos/sin so the hs-segments each appear at the correct x/y coordinates, given by the angle of the hs.
		     draw_sprite_ext(spr_hs_text, 0, obj_player.x + ( cos(hs_angle) * i ) + ( cos(hs_angle) * (hs_width/2) ), (obj_player.y - (sin(hs_angle) * i )) + (sin( hs_angle ) * (hs_width/2) ), 1, 1, radtodeg(hs_angle), c_white, 1);
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
