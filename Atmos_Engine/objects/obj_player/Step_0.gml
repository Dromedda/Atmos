#region Key Input 

	var key_left  = keyboard_check(ord("A")); 
	var key_right = keyboard_check(ord("D")); 
	
	var key_jump      = keyboard_check_pressed(vk_space); 
	var key_jump_held = keyboard_check(vk_space); 

#endregion

#region Delta Time

	var delta_t = (delta_time/10000); 

#endregion

#region Basic Movement

	#region Move Calculations 

		var move_dir_x = key_right - key_left; 
	
		if ((move_dir_x != 0) && (current_move_dir_x == move_dir_x)) {
			if (move_speed < move_speed_max) {
				move_speed += move_speed_acceleration; 
			} else {
				move_speed = move_speed_max; 	
			}
		} else {
			move_speed = 0;

		}
	
		current_move_dir_x = move_dir_x; 
	
		x_speed = ((move_speed * move_dir_x)* delta_t); 

	#endregion
	
	#region Gravity && onground check

		if (!place_meeting(x, y + 1, obj_collider)) {
			on_ground = false; 
			grav = grav_base; 
			if (grav < grav_max) {
				grav += grav_acceleration; 	
			}
			y_speed += grav * delta_t; 
		} else {
			on_ground = true; 	
		}

	#endregion
	
	#region Jumping

		if (place_meeting(x, y + 1, obj_collider)) {
			jumps = jumps_max; 	
		}
		if ((key_jump) && (jumps > 0)) {
			jumps -= 1; 
			y_speed = -jump_impulse * delta_t; 
		}
		if ((y_speed < 0) && (!key_jump_held)) {
			y_speed += grav * delta_t; 	
		}

	#endregion
	
	#region Collisions Detection

		//Horizontal 
		if (!place_meeting(x + x_speed, y, obj_collider)) {
			x += x_speed; 	
		} else {
			while (!place_meeting(x + sign(x_speed), y, obj_collider)) {
				x += sign(x_speed); 	
			}
		}
	
		//Vertical
		if (!place_meeting(x, y + y_speed, obj_collider)) {
			y += y_speed; 	
		} else {
			while (!place_meeting(x, y + sign(y_speed), obj_collider)) {
				y += sign(y_speed);	
			}
		}

	#endregion
	
#endregion

#region Animations

	#region Facing Dir
	
		if (x_speed < 0) {
			facing_dir = -1; 	
		} else if (x_speed > 0) {
			facing_dir = 1; 	
		} 
	
	#endregion

#endregion