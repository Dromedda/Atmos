if (resolution != noone) {
	
 	switch(resolution) {
		case "900" : 
			width = 1600; 
			height = 900; 
		break; 
		
		case "720" : 
			width = 1280; 
			height = 720; 
		break;
		
		case "360" : 
			width = 640; 
			height = 360; 
		break; 
	}
	
	if (keyboard_check_pressed(vk_f11)) {
		toggle = !toggle; 	
	}
	
	if (toggle) {
		window_set_size(width, height); 
	}
}
