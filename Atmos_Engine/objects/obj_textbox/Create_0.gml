#region Text

	 text_to_draw = "Hmm... Looks like the creator of this game forgot to give me something to say.."; 

#endregion


#region Alignment Variables
	
	text_box_margin = 32;  

	text_height = (font_get_size(fnt_text_box_standard) + 6); 
	
	text_w = (sprite_get_width(spr_text_box_background) - text_box_margin);

#endregion 

#region Position Variables 

	x_pos = (obj_camera.x - (320));   
	y_pos = (obj_camera.y + (sprite_get_height(spr_text_box_background) - 60)); 

#endregion

#region Setup Variables 

	page = 0; 
	char_count = 0; 
	creator = noone;  
	
	writing_speed = 5; 

#endregion

#region Apply Position Variables

	x = x_pos; 
	y = y_pos;  

#endregion