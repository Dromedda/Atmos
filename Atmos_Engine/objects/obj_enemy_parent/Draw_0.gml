#region Flickering Upon taking Damage Effect

	if (place_meeting(x, y, obj_player_melee)) {
		image_alpha = 0; 	
	}

	if (invis) && (invis_flicker <= 0) {
		if (image_alpha == 0) {
			image_alpha = 1;
	 	} else {
			image_alpha = 0; 	
		}
	} else if (invis_flicker >= 1) {
		invis_flicker--; 	
	}

	if (!invis) {
		image_alpha = 1; 	
	}

#endregion

//Draw Self
draw_self(); 