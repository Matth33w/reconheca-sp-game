moveHorizontal = keyboard_check(vk_right) - keyboard_check(vk_left);
moveVertical = keyboard_check(vk_down) - keyboard_check(vk_up);

currentX += moveHorizontal * xAcceleration;
currentY += yGravity;

currentX = clamp(currentX, -xMax, xMax);
currentY = clamp(currentY, -yMax, yMax);

onGround = place_meeting(x, y + 1, obj_ground);

if(!place_meeting(x + round(currentX), y, obj_ground)) {
	x += round(currentX);	
} else {
	while(!place_meeting(x + sign(currentX), y, obj_ground)) {
		x += sign(currentX);	
	}
}

if(moveHorizontal == 0 && currentX > 0 && currentX >= xDeceleration){
	currentX -= xDeceleration;	
} else if(moveHorizontal == 0 && currentX > 0 && currentX < xDeceleration) {
	currentX = 0;	
}

if(moveHorizontal == 0 && currentX < 0 && currentX <= -xDeceleration){
	currentX += xDeceleration;	
} else if(moveHorizontal == 0 && currentX < 0 && currentX > -xDeceleration) {
	currentX = 0;	
}

if(!place_meeting(x, y + round(currentY), obj_ground)){
	y += round(currentY);
} else {
	while(!place_meeting(x, y + sign(currentY), obj_ground)){
		y += sign(currentY);
	}
	
	currentY = 0;
}

if(onGround && keyboard_check(vk_space)){
	currentY = -5;
}

if(place_meeting(x + moveHorizontal, y, obj_ground) && onGround){
	for(var i = 0; i < abs(round(currentX)); i++) {
		if(!place_meeting(x + moveHorizontal, y - 1, obj_ground)){
			x += moveHorizontal;
			y -= 1;
		} else if(place_meeting(x + moveHorizontal, y - 1, obj_ground)) {
			currentX = 0;
		}
	}
}

if(!place_meeting(x + moveHorizontal, y + 1, obj_ground) && onGround && !keyboard_check(vk_space) && place_meeting(x + moveHorizontal, y + 3, obj_ground)){
	currentY = abs(currentX);
}

show_debug_message(currentX);