#region Variables 

	#region Movement
	
		move_speed = 2.8; 
		move_speed_acceleration = 0.4; 
		move_speed_max = move_speed; 
		
		x_speed = 0; 
		y_speed = 0; 
		
		jumps = 0; 
		jumps_max = 2; 
		jump_impulse = 6; 

		grav = 0;
		grav_base = 0.2; 
		grav_max = 1; 
		grav_acceleration = 0.16; 
		
		current_move_dir_x = 0; 

		on_ground = false; 
	
	#endregion
	
	#region Animations 
	
		facing_dir = 0; 
	
	#endregion

#endregion