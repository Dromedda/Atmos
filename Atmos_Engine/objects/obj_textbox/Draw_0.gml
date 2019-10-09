 
#region Draw TextBox 

	draw_sprite(spr_text_box_background, -1, x, y); 

#endregion

#region Setup X & Y Coordinate

	text_x = x + text_box_margin; 
	text_y = y + text_box_margin;

#endregion

#region Draw Text
	
	part_of_text = string_copy(text_to_draw[page], 1, char_count); 
	
	draw_set_font(fnt_text_box_standard); 
	draw_text_ext(text_x, text_y, part_of_text, text_height, text_w);
	
#endregion