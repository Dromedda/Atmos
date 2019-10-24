#region Delta_t

	var delta_t = delta_time/10000; 

#endregion

#region Take Damage And Death

	//check collisions and apply base damage
	if ((place_meeting(x, y, obj_player_damage_parent)) && (!invis)) {
		hp -= obj_player_damage_parent.dmg;
		invis = true; 
		knock_back_bool = true;	
	}
	
	//Knockback	
	if ((knock_back_bool) && (knock_back_timer >= 1)) {
		knock_back_timer--; 	
		
		if (obj_player.x < x) {
			knock_back_dir = 1; 	
		} else {
			knock_back_dir = -1; 	
		}
		
		x_speed = (knock_back * knock_back_dir) * delta_t;
	
	} else {
		x_speed = 0; 
		knock_back_bool = false; 
		knock_back_timer = knock_back_timer_org; 
	}
	
	if ((invis) && (invisible_timer >= 1)) {
		invisible_timer--; 	
	} else {
		invisible_timer = invisible_timer_base; 
		invis = false;
		
		//DEATH
		if (hp <= 0) {
			instance_destroy(self); 
		}
	}

#endregion

#region Collisions And Applying X/Y speed to x/y Coordinate
	
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

