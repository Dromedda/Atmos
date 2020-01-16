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
		
		switch(resolution) {
			case "900" : 
				width = 640; 
				height = 360; 
				resolution = "360"; 
			break; 
		
			case "720" : 
				width = 1600; 
				height = 900; 
				resolution = "900"; 
			break;
		
			case "360" : 
				width = 1280; 
				height = 720; 
				resolution = "720";
			break; 
		}	
	}
	
	if (!window_get_fullscreen()) {
		
		show_debug_message(window_get_fullscreen()); 
		
		if ((width != window_width_prev) || (height != window_height_prev)) {
			window_set_size(width, height); 
		} else {
			height = window_height_prev; 
			width = window_width_prev; 
		}
	}
 
} else {
	resolution = "360"; 	
} 
