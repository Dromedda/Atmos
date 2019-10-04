#region Update Camera

	var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0); 
	camera_set_view_mat(obj_camera.camera,vm);

#endregion

#region Camera Pos 

	x = cx; 
	y = cy; 

#endregion
