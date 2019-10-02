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
		grav_acceleration = 0.08; 
		
		move_dir_x = 0; 
		
		current_move_dir_x = 0; 

		on_ground = false; 
		
		wall_jump = 0; 
		
		 
	
	#endregion
	
	#region Hookshot
	
		hs_inst = noone; 
		hs_cd = 10;
		hs_cd_base = hs_cd; 
		
		hs_x_to = 0; 
		hs_y_to = 0; 
	
	#endregion
	
	#region Animations 
	
		facing_dir = 0; 
	
	#endregion
	
	state = "normal";
	/*
	DIFFERENT STATES: 
	"normal" 
	"hookshot"	
	*/

#endregion