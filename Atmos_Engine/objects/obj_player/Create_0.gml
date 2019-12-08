#region Variables 

	#region Movement
	
		//Movement Speed
		move_speed = 2.2; 
		move_speed_acceleration = 0.4; 
		move_speed_max = move_speed; 
		move_speed_max_org = move_speed_max; 
		
		//Topdown Movement Speed
		move_speed_td = (move_speed * 0.9); 
		move_speed_td_max = move_speed_td; 
		move_speed_td_max_org = move_speed_td_max; 
		move_speed_td_max_diag = (move_speed_max * 0.707); 
		
		//Movement Application 
		x_speed = 0; 
		y_speed = 0; 
		
		x_start = x; 
		y_start = y; 
		
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
		move_dir_y = 0; 
		
		current_move_dir_x = 0; 
		current_move_dir_y = 0; 
		
		//On ground
		on_ground = false; 
		
		//Wall jump
		wall_jump = 0; 	
		max_wall_jump = 2; 
		wall_jumped = false; 
	
	#endregion
	
	#region Melee
	
		melee_cd = 10; 
		melee_cd_base = melee_cd; 
	
	#endregion
	
	#region Hookshot
	
		hs_inst = noone; 
		hs_cd = 6;
		hs_cd_base = hs_cd; 
		
		hs_x_to = 0; 
		hs_y_to = 0; 
		
		hs_speed = 0.04; 
		hs_collisions_tolerance = 2; 
	
	#endregion
	
	#region Ducking 
	
		ducking = false; 
		ducking_move_speed = (move_speed_max * 0.5); 
	
	#endregion
	
	#region Sprinting
	
		sprinting = false; 
		sprinting_move_speed = (move_speed_max * 1.3); 
		sprinting_image_speed = 1.75; 
	
	#endregion
	
	#region Damage

		invisible_timer = 30; 
		invisible_timer_base = invisible_timer;
		invis = false; 
		invis_flicker = 4; 
	
		knock_back = 16; 
		knock_back_dir = 0; 
		knock_back_timer = 8; 
		knock_back_timer_org = knock_back_timer; 
		knock_back_bool = false; 
	
	#endregion
	
	#region stats 
	
		hp = 20; 
		hp_org = hp; 
	
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
	"topdown"
	@todo Add Noclip Mode here. 
	*/

#endregion

#region Create Neccesary Player Controller Objects. 

	instance_create_layer(0, 0, "Player", obj_player_gui); 

#endregion
