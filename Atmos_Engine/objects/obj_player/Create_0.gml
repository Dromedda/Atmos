#region Variables 

	#region Movement
	
		//Movement
		move_speed = 2.2; 
		move_speed_acceleration = 0.4; 
		move_speed_max = move_speed; 
		move_speed_max_org = move_speed_max; 
		
		//Movement Application 
		x_speed = 0; 
		y_speed = 0; 
		
		//Jumping
		jumps = 0; 
		jumps_max = 2; 
		jump_impulse = 2.6; 

		//Gravity
		grav = 0;
		grav_base = 0.05; 
		grav_max = 0.4; 
		grav_acceleration = 0.1; 
		
		//Glide
		glide_grav = 0.04; 
		glide_timer = 60; 
		glide_timer_base = glide_timer; 
		
		//Move Direction 
		move_dir_x = 0; 
		
		current_move_dir_x = 0; 
		
		//On ground
		on_ground = false; 
		
		//Wall jump
		wall_jump = 0; 	
		max_wall_jump = 2; 
		wall_jumped = false; 
	
	#endregion
	
	#region Melee
	
		melee_cd = 30; 
		melee_cd_base = melee_cd; 
	
	#endregion
	
	#region Hookshot
	
		hs_inst = noone; 
		hs_cd = 60;
		hs_cd_base = hs_cd; 
		
		hs_x_to = 0; 
		hs_y_to = 0; 
		
		hs_speed = 0.04; 
	
	#endregion
	
	#region Ducking 
	
		ducking = false; 
		ducking_move_speed = (move_speed_max * 0.5); 
	
	#endregion
	
	#region Animations 
	
		facing_dir = 0; 
		anim_state = "idle"; 
	
	#endregion
	
	state = "standard";
	/*
	DIFFERENT STATES: 
	"standard" 
	"hookshot"	
	*/

#endregion