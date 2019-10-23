#region Delta Time

	var delta_t = (delta_time/10000); 

#endregion

#region Hs Move

	x_speed = ((move_speed * x_dir) * delta_t); 
	y_speed = ((move_speed * y_dir) * delta_t); 

#endregion

#region Collisions 

	//to check collisions with other objects just copy this region and exchange the "obj_collider" with the 
	//the object to check collisiosns with. then make sure to set collided to true, since it acts as a trigger
	//for the player hookshot state. 
	
	//Horizontal 
	if ((!place_meeting(x + x_speed, y, obj_collider)) && (!place_meeting(x + x_speed, y, obj_enemy_parent))) {
		x += x_speed; 	
	} else if ((!place_meeting(x + sign(x_speed), y, obj_collider)) && (!place_meeting(x + sign(x_speed), y, obj_enemy_parent))) {
		x += sign(x_speed); 	
	} else {
		collided = true; 
	}
	
	//Vertical
	if ((!place_meeting(x, y + y_speed, obj_collider)) && (!place_meeting(x, y + y_speed, obj_enemy_parent))) {
		y += y_speed; 	
	} else if ((!place_meeting(x, y + sign(y_speed), obj_collider)) && (!place_meeting(x, y + sign(y_speed), obj_enemy_parent))) {
		y += sign(y_speed);	
	} else {
		collided = true; 
	}
		
	


#endregion

#region Collided

	if (collided) {
		if (mouse_check_button(mb_right)) {
			obj_player.state = "hookshot"; 
			obj_player.hs_inst = self; 
			if (obj_player.jumps <= 1) {
				obj_player.jumps += 1; 	
			}
		} else {
			obj_player.state = "standard"; 
			obj_player.hs_inst = noone; 
			instance_destroy(self); 	
		}
	} 

#endregion

#region Failsafe 

	if (!mouse_check_button(mb_right)) {
		instance_destroy(self); 	
	}

	hs_x_rng = (hs_x_range / 2); 
	hs_y_rng = (hs_y_range / 2); 

	if (!collision_rectangle(x - hs_x_rng, y - hs_y_rng, x + hs_x_rng, y + hs_y_rng, obj_player, false, true)) {
		instance_destroy(self); 	
	}

#endregion

#region Debugging 

	show_debug_message(collided); 

#endregion