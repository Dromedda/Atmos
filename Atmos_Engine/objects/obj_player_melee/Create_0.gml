#region Variables

	dmg = 4; 
	
	duration = 3; 
	
	offset = 32; 

#endregion

#region Direction

	dir = 1; 

	if (mouse_x < x) {
		dir = -1; 	
	} else {
		dir = 1; 	
	}
	
	ox = x; 

#endregionw