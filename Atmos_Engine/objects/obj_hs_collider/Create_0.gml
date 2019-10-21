#region Variables 

	x_dir = 0; 
	y_dir = 0;
	
	x_speed = 0; 
	y_speed = 0; 
	
	move_speed = 12; 
	
	collided = false; 
	
	hs_x_range = 1280;
	hs_y_range = 720; 

#endregion

#region Get Direction
	
	var mouse_angle = point_direction(x, y, mouse_x, mouse_y); 

	//@todo Make this based on mouse position realtive to the window and not the player. 
	//Split the screen into 4 triangles cenetered in the middle. centre = window_width/2 && window_height/2 
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
