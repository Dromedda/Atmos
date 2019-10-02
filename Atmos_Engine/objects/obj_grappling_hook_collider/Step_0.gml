#region Key Input

	var key_cancel = mouse_check_button_pressed(mb_right); 

#endregion

#region Failsafe Timer

	if (fail_safe_timer >= 1) {
		fail_safe_timer--; 	
	} else {
		obj_player.gp_deployed = false; 
		instance_destroy(self); 	
	}

#endregion

#region Move until collisions with Collider

	if (!place_meeting(x, y, obj_collider)) {
		speed = 12; 
		direction = dir; 
	} else {
		collider_collided = true; 
		speed = 0; 
	}	

#endregion
