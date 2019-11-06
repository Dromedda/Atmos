draw_self();

#region Draw Hookshot Line 
	
	
	
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
