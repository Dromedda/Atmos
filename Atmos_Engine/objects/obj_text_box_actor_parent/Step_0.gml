#region Interaction Key Variable

	var key_interact = (keyboard_check_pressed(ord("E"))); 

#endregion

 #region Trigger TextBox	
	
	if (place_meeting(x, y, obj_player)) {
			can_interact = true;  
			if (my_text_box == noone) && (key_interact) {
				my_text_box = instance_create_layer(0, 0, "TextBoxLayer", obj_textbox); 
				my_text_box.creator = self; 
				my_text_box.text_to_draw = dialogue;
				
			}
			
		} else {
			can_interact = false; 
			if (my_text_box != noone) {
				instance_destroy(my_text_box); 
				my_text_box = noone; 
			}
		}
		
#endregion