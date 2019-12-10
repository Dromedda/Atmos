#region Key Input 

	var key_left  = keyboard_check(ord("A")); 
	var key_right = keyboard_check(ord("D")); 
	
	var key_down = keyboard_check(ord("S")); 
	var key_down_rel = keyboard_check_released(ord("S")); 
	
	var key_up = keyboard_check(ord("W")); 
	
	var key_jump      = keyboard_check_pressed(vk_space); 
	var key_jump_held = keyboard_check(vk_space); 
	
	var key_mbr_prsd = mouse_check_button_pressed(mb_right); 
	var key_mbr_held = mouse_check_button(mb_right); 
	var key_mbl_prsd = mouse_check_button_pressed(mb_left); 

	var key_lshft = keyboard_check(vk_lshift); 

#endregion

#region Delta Time

	var delta_t = (delta_time/10000); 

#endregion

#region Noclip Mode

	if (obj_debugger.noclip) {
		state = "noclip"; 
		x_speed = 0; 
		y_speed = 0; 
	}

#endregion

#region Player State

	//Player States
	switch(state) { 

		case "standard": 
	
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
						glide_timer = glide_timer_base; 
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
	
					if ((!on_ground) && (wall_jump < max_wall_jump)) {
						if ((place_meeting(x + 1, y, obj_collider)) || (place_meeting(x - 1, y, obj_collider))) { 	
							//@todo Make Player Kick off the wall instead of just gliding up it. 
							if (key_jump) && (!wall_jumped) {
								wall_jumped = true; 
							}
							if (wall_jumped) && (wall_jump < max_wall_jump) {
								jumps += 1; 	
								wall_jump += 1;
								wall_jumped = false; 
							}
						}
					} 
	
				#endregion
				
				#region (damage) and death
				
					//@todo Make player Hp global and persistent through the rooms(?). 
					//Check Collision with enemy parent
					if ((place_meeting(x, y, obj_enemy_parent)) && (!invis)) {
				
						invis = true; 
						knock_back_bool = true;
						
						//Get enemy id and reduce player hp with that objects .dmg variable. 
						var enmy = instance_place(x, y, obj_enemy_parent); 
						if ((enmy != noone) && (enmy.dmg != noone)) { //Makesure object exists and has the correct variables. 
							hp -= enmy.dmg; 	
								
							if (obj_enemy_parent.x < x) { 
								knock_back_dir = 1; 	
								x_speed = 0; 
							} else {
								knock_back_dir = -1; 	
								x_speed = 0; 
							}
						}

					}
	
					//Knockback	
					if ((knock_back_bool) && (knock_back_timer >= 1)) {
						knock_back_timer--; 	
						
						if (place_meeting(x, y, obj_enemy_parent)) {
							x_speed = (knock_back * knock_back_dir) * delta_t;
						}

					} else { 
						knock_back_bool = false; 
						knock_back_timer = knock_back_timer_org; 
					}
	
					if ((invis) && (invisible_timer >= 1)) {
						invisible_timer--; 	
					} else {
						invisible_timer = invisible_timer_base; 
						invis = false;
					}
					
					//DEATH
					if (hp <= 0) {
						room_restart(); 
						x = x_start; 
						y = y_start; 
						hp = (hp_org/2); 
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
			
					if ((key_mbl_prsd) && (melee_cd <= 0)) {
						instance_create_layer(x, y, "Player", obj_player_melee); 
						melee_cd = melee_cd_base; 
					}
			
				#endregion
			
				#region Ducking
				//@todo Is this really neccessary(?)
					if ((key_down) && (!place_meeting(x + ((sprite_get_width(sprite_index)/2)), y, obj_collider))) {
						if (!place_meeting(x - ((sprite_get_width(sprite_index)/2)), y, obj_collider)) {
							ducking = true; 
						}
					} else if ((key_down_rel) && (ducking)) {
						if (!place_meeting(x, y - (sprite_get_height(sprite_index)/2), obj_collider)) {
							ducking = false;
							y -= (sprite_get_height(sprite_index)/2); 
						}	 	
					}
				
					if (ducking) { //@note swap anim-states in the future, instead of of just rotating the player sprite. 
						if (x_speed > 0) {
							image_angle = 90;
						} else if (x_speed <= 0) {
							image_angle = -90; 	
						}
						if (on_ground) { //@note Maybe keep the initial x_speed and reduce it until it matches Ducking Movespeed(?). 
							move_speed_max = ducking_move_speed; 	
						} else {
							move_speed_max = move_speed_max_org; 	
						}
					} else if (!ducking) {
						image_angle = 0; 
						move_speed_max = move_speed_max_org; 
					
					}
				
				#endregion
			
				#region Sprinting
					if ((key_lshft) && (!ducking) && (x_speed != 0)) {
						//show_debug_message("Sprinting"); 
						
						sprinting = true; 
						move_speed_max = sprinting_move_speed; 	
						//show_debug_message(move_speed_max); 
					} else if (!ducking) {
						//show_debug_message("!Sprinting"); 
						sprinting = false; 
						move_speed_max = move_speed_max_org; 		
					} else {
						sprinting = false; 	
					}
				
				#endregion
			
		break;
			
			#endregion

		case "hookshot": 
			x_speed = 0; 
			y_speed = 0; 
			grav = 0; 
				
			if (hs_inst != noone) {
				hs_x_to = (((hs_inst.x) - x) * hs_speed); 
				hs_y_to = (((hs_inst.y) - y) * hs_speed);		
			
				if (!place_meeting(x + (hs_x_to * hs_collisions_tolerance), y, obj_collider)) {
					x += hs_x_to * delta_t; 	
				} else {
					state = "standard"; 	
				}
			
				if (!place_meeting(x, y + (hs_y_to * hs_collisions_tolerance), obj_collider)) {
					y += hs_y_to * delta_t; 	
				} else {
					state = "standard";	
				}
			
			} else {
				state = "standard"; 	
			}
			
			//Check Collision with enemy parent
			if ((place_meeting(x, y, obj_enemy_parent)) && (!invis)) {
				invis = true; 
				knock_back_bool = true;
						
				//Get enemy id and reduce player hp with that objects .dmg variable. 
				var enmy = instance_place(x, y, obj_enemy_parent); 
				if ((enmy != noone) && (enmy.dmg != noone)) { //Makesure object exists and has the correct variables. 
					hp -= enmy.dmg; 	
								
					if (obj_enemy_parent.x < x) { 
						knock_back_dir = 1; 	
						x_speed = 0; 
					} else {
						knock_back_dir = -1; 	
						x_speed = 0; 
					}
				}
			}
	
			//Knockback	
			if ((knock_back_bool) && (knock_back_timer >= 1)) {
				knock_back_timer--; 	
						
				if (place_meeting(x, y, obj_enemy_parent)) {
					x_speed = (knock_back * knock_back_dir) * delta_t;
				}

			} else { 
				knock_back_bool = false; 
				knock_back_timer = knock_back_timer_org; 
			}
	
			if ((invis) && (invisible_timer >= 1)) {
				invisible_timer--; 	
			} else {
				invisible_timer = invisible_timer_base; 
				invis = false;
			}
					
			//DEATH
			if (hp <= 0) {
				room_restart(); 
				x = x_start; 
				y = y_start; 
				hp = (hp_org/2); 
			}
			
		break; 
		
		case "topdown": 
			move_dir_x = key_right - key_left; 
			move_dir_y = key_down - key_up; 
			
			if ((move_dir_x != 0) && (move_dir_y != 0)) {
				move_speed_td_max = move_speed_td_max_diag; 
			} else {
				move_speed_td_max = move_speed_td_max_org; 	
			}
			
			if (((move_dir_x != 0) ||(move_dir_y != 0)) && ((current_move_dir_x == move_dir_x) ||(current_move_dir_y == move_dir_y))) {
				if (move_speed_td < move_speed_td_max) {
					move_speed_td_ += move_speed_acceleration; 
				} else {
					move_speed_td_ = move_speed_td_max; 	
				}	
			}
			
			x_speed = ((move_speed_td_max * move_dir_x) * delta_t); 
			y_speed = ((move_speed_td_max * move_dir_y) * delta_t); 
			
			current_move_dir_x = move_dir_x; 
			current_move_dir_y = move_dir_y; 
			
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
			
			#region Dash
			
				//@todo Imploment Dasing in top down Mode
			
			#endregion

		break; 
		
		case "noclip": 
			
			var noclip_speed = 8; 
			
			if (key_lshft) {
				noclip_speed = 16; 	
			} else {
				noclip_speed = 8; 	
			}
			
			
			var y_dir = key_down - key_up; 
			var x_dir = key_right - key_left; 
			
			x += (noclip_speed * x_dir); 
			y += (noclip_speed * y_dir); 
			
			if (!obj_debugger.noclip) {
				state = "standard"; 	
			}
			
		break; 
		
	}
	
#endregion

#region TopDown Movement 

	if (room == rm_hub) {
		state = "topdown"; 	
	}

#endregion

#region HookShot

	if (room != rm_hub) {
		
		#region Old Sys
			/*
			if ((state != "hookshot") && (hs_cd >= 1)) {
				hs_cd--; 
				show_debug_message(hs_cd); 
			}


			if (key_c) && (hs_cd <= 0) {
				hs_inst = noone; 
				if (place_meeting(mouse_x, mouse_y, obj_hookshot_point)) {
					if (jumps <= 1) {
						jumps += 1; 	
					}
					state = "hookshot"; 
					hs_cd = hs_cd_base; 
				} else { 
				
				}
			} else if ((state == "hookshot") && (mouse_check_button_released(mb_right))) {
				state = "standard"; 	
			}
			*/
		#endregion
		
		if ((state != "hookshot") && (hs_cd >= 1)) {
			hs_cd--; 
			show_debug_message(hs_cd); 
		}
		
		if ((key_mbr_prsd) && (hs_cd <= 0) && (!instance_exists(obj_hs_collider))) {
			instance_create_layer(x, y, "Player", obj_hs_collider);  
			
		}
		
		if (state == "hookshot") {
			if (mouse_check_button_pressed(mb_right)) {
				state = "standard";
				if (jumps <= 1) {
					jumps += 1; 	
				}
				instance_destroy(obj_hs_collider); 
				hs_cd = hs_cd_base; 
				hs_inst = noone; 
			}
		}
		
	}

#endregion

#region Animations

	#region Sprinting
	
		if (sprinting) {
			image_speed = sprinting_image_speed; 
		} else {
			image_speed = 1; 	
		}
			
			
	#endregion
	
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
	
	#region Animation States
	
		if (state == "standard") {
			//Imploment Jumping Sprite
			if (!on_ground) {
				if (y_speed < 0) {
					anim_state = "jump_up"; 
				} else if (y_speed >= 0) {
					anim_state = "jump_down"; 	
				}
			} else if ((on_ground) && (x_speed != 0)) {
				anim_state = "run"; 	
			} else if ((on_ground) && (x_speed == 0)) {
				anim_state = "idle"; 	
			} else {
				anim_state = "unknown"; 	
			}
			
		} else if (state == "topdown") {
			if ((x_speed != 0) ||(y_speed != 0)) {
				anim_state = "run"; 
			} else if ((x_speed == 0) && (y_speed == 0)) {
				anim_state = "idle"; 	
			} else {
				anim_state = "unknown"; 	
			}
		} else if (state == "noclip") {
			anim_state = "noclip"; 	
		}
		
		switch(anim_state) {
			case "run": 
				sprite_index = spr_player_run; 
				break; 
			case "idle": 
				sprite_index = spr_player_idle; 
				break; 
			case "jump_up":
				sprite_index = spr_player_jump_up; 
				break; 
			case "jump_down": 
				sprite_index = spr_player_jump_down; 
				break; 
			case "unknown": 
				sprite_index = spr_player_static; 
				break; 
			case "noclip": 
				sprite_index = spr_player_static; 
				break; 
		}
	
	#endregion

#endregion

#region Debugging 

	show_debug_message(state); 

#endregion