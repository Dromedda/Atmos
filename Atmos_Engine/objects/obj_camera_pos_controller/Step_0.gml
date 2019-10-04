#region Camera Pos Controller

	var px = obj_player.x; 
	var py = obj_player.y; 
	
	var x1, x2, x3, x4; 
	var y1, y2, y3, y4; 
	
	x1 = 640; 
	x2 = 1280; 
	x3 = 1920;
	x4 = 2560;
	
	y1 = 360; 
	y2 = 720; 
	y3 = 1080; 
	y4 = 1440; 
	
	if (px <= x1) {
		obj_camera.cx = ((x1 - x1) + x1/2); 	
	} else if (px <= x2) {
		obj_camera.cx = ((x2 - x1) + x1/2); 	
	} else if (px <= x3) {
		obj_camera.cx = ((x3 - x1) + x1/2); 	
	} else if (px <= x4) {
		obj_camera.cx = ((x4 - x1) + x1/2); 	
	}
	
	if (py <= y1) {
		obj_camera.cy = ((y1 - y1) + y1/2); 	
	} else if (py <= y2) {
		obj_camera.cy = ((y2 - y1) + y1/2); 	
	} else if (py <= y3) {
		obj_camera.cy = ((y3 - y1) + y1/2); 	
	} else if (py <= y4) {
		obj_camera.cy = ((y4 - y1) + y1/2); 	
	}


#endregion