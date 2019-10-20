#region Variables 

	x_dir = 0; 
	y_dir = 0;
	
	x_speed = 0; 
	y_speed = 0; 
	
	move_speed = 8; 
	
	collided = false; 
	
	hs_x_range = 1280;
	hs_y_range = 720; 

#endregion

#region Get Direction
	
	var mouse_angle = point_direction(x, y, mouse_x, mouse_y); 

	if ((mouse_angle > -45) && (mouse_angle < 45)) {
		x_dir = 1; 
		y_dir = 0; 
	} else if ((mouse_angle > 45) && (mouse_angle < 135)) {
		x_dir = 0; 
		y_dir = -1; 
	} else if ((mouse_angle > 135) && (mouse_angle < 225)) {
		x_dir = -1; 
		y_dir = 0; 
	} else if ((mouse_angle > 225) && (mouse_angle < 315)) {
		x_dir = 0; 
		y_dir = 1; 
	} else {
		x_dir = 1; 
		y_dir = 0; 
	}

#endregion
