#region Take Damage and death

	if ((place_meeting(x, y, obj_player_damage_parent)) && (!invis)) {
		hp -= obj_player_damage_parent.dmg;
		invis = true; 
		//emit_dmg_particles = true; 
		
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
	
	#region Emit Particles 
		
		/*
		if (emit_dmg_particles) {
			part_particles_create(global.ps, x, y, global.pt_sword_hit, 32); 
			emit_dmg_particles = false; 
		} 
		*/
		
	#endregion

#endregion
