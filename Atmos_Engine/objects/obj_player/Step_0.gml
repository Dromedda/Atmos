#region Key Input 

	var key_left  = keyboard_check(ord("A")); 
	var key_right = keyboard_check(ord("D")); 
	
	var key_jump      = keyboard_check_pressed(vk_space); 
	var key_jump_held = keyboard_check(vk_space); 
	
	var key_c = mouse_check_button_pressed(mb_right); 
	var key_l = mouse_check_button_pressed(mb_left); 

#endregion

#region Delta Time

	var delta_t = (delta_time/10000); 

#endregion

//Player States
switch(state) { 

	case "normal": 
	
		#region Movement

			#region Move Calculations 

				move_dir_x = key_right - key_left; 
	
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
					wall_jump = 0; 
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
	
			#region Wall Jumping 
	
				if ((!on_ground) && (wall_jump == 0)) {
					if ((place_meeting(x + 1, y, obj_collider)) || (place_meeting(x - 1, y, obj_collider))) { 	
						//@todo Make Player Kick off the wall instead of just gliding up it. 
						jumps += 1; 	
						wall_jump = 1; 
					}
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
			
			#region Melee 
			
				if (melee_cd >= 1) {
					melee_cd--; 	
				}
			
				if ((key_l) && (melee_cd <= 0)) {
					instance_create_layer(x, y, "Player", obj_player_melee); 
					melee_cd = melee_cd_base; 
				}
			
			#endregion
			
			break;
			
	#endregion

	case "hookshot": 
		x_speed = 0; 
		y_speed = 0; 
		grav = 0; 
	
		hs_inst = instance_position(mouse_x, mouse_y, obj_hookshot_point); 
		if (hs_inst != noone) {
			hs_x_to = (((hs_inst.x + 16) - x) * 0.02); 
			hs_y_to = (((hs_inst.y + 16) - y) * 0.02);		
			
			
			if (!place_meeting(x + hs_x_to, y, obj_collider)) {
				x += hs_x_to * delta_t; 	
			} else {
				state = "normal"; 	
			}
			
			if (!place_meeting(x, y + hs_y_to, obj_collider)) {
				y += hs_y_to * delta_t; 	
			} else {
				state = "normal";	
			}
			
		} else {
			state = "normal"; 	
		}
		break; 
}

#region HookShot

	if ((state != "hookshot") && (hs_cd >= 1)) {
		hs_cd--; 
		show_debug_message(hs_cd); 
	}


	if (mouse_check_button_pressed(mb_right)) && (hs_cd <= 0) {
		hs_inst = noone; 
		if (place_meeting(mouse_x, mouse_y, obj_hookshot_point)) {
			state = "hookshot"; 
			hs_cd = hs_cd_base; 
		}
	} else if ((state == "hookshot") && (mouse_check_button_released(mb_right))) {
		state = "normal"; 	
	}

#endregion

#region Animations

	#region Facing Dir
	
		if (x_speed < 0) {
			facing_dir = -1; 	
		} else if (x_speed > 0) {
			facing_dir = 1; 	
		} 
	
	#endregion
	
	#region Flip Player
		
		if (facing_dir != 0) {
			image_xscale = facing_dir; 
		} else {
			image_xscale = 1; 	
		}
		
	#endregion

#endregion