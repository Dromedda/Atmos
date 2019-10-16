#region Flickering Upon taking Damage Effect

	if (place_meeting(x, y, obj_player_melee)) {
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

//Draw Self
draw_self(); 