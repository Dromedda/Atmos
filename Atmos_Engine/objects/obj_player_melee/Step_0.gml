#region Timer 

	if (duration >= 1) {
		duration--; 	
	} else {
		instance_destroy(self); 	
	}

#endregion

#region Direction && Offset

	x = (ox + (offset * dir)); 

#endregion