#region Setup Main Camera

	camera = camera_create();

	var vm = matrix_build_lookat (x, y, -10, x, y, 0, 0, 1, 0);

	//Determine Resolution and camera type
	var pm = matrix_build_projection_ortho(640, 360, 1, 10000);

	camera_set_view_mat(camera,vm);
	camera_set_proj_mat(camera,pm);

	view_camera[0] = camera;

#endregion

#region 

cx = x + 288; 
cy = y + 148; 



#endregion