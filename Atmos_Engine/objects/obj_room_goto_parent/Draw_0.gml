#region Draw if Interactable 

	if (place_meeting(x, y, obj_player)) {
		draw_set_font(fnt_text_box_standard); 
		draw_text(x - 16, y - 16, ("Go to: " + string(goto_room))); 	
	}

#endregion

#region Draw Self

	draw_self(); 

#endregion 