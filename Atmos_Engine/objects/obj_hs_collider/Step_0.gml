#region Delta Time

	var delta_t = (delta_time/10000); 

#endregion

#region Hs Move

	x_speed = ((move_speed * x_dir) * delta_t); 
	y_speed = ((move_speed * y_dir) * delta_t); 

#endregion

#region Collisions 

	//Horizontal 
	if (!place_meeting(x + x_speed, y, obj_collider)) {
		x += x_speed; 	
	} else if (!place_meeting(x + sign(x_speed), y, obj_collider)) {
		x += sign(x_speed); 	
	} else {
		collided = true; 
	}
	
	//Vertical
	if (!place_meeting(x, y + y_speed, obj_collider)) {
		y += y_speed; 	
	} else if (!place_meeting(x, y + sign(y_speed), obj_collider)) {
		y += sign(y_speed);	
	} else {
		collided = true; 
	}

#endregion

#region Collided

	if (collided) {
			obj_player.state = "hookshot"; 
			obj_player.hs_inst = self; 
	}

#endregion

#region Failsafe 

	hs_x_rng = (hs_x_range / 2); 
	hs_y_rng = (hs_y_range / 2); 

	if (!collision_rectangle(x - hs_x_rng, y - hs_y_rng, x + hs_x_rng, y + hs_y_rng, obj_player, false, true)) {
		instance_destroy(self); 	
	}

#endregion

#region Debugging 

	show_debug_message(collided); 

#endregion