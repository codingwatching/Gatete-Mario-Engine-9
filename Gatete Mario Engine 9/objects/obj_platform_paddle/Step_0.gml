/// @description Paddle Wheel platform logic

/*
// To prevent the screen from going nuts, do not change the events of this object.
*/

//If the platforms are not activated, exit
if (active == false)
	exit;

//Do not move if Mario is dead or transforming
if (!instance_exists(obj_mario_dead))
&& (!instance_exists(obj_mario_transform)) {

	angle += turn_speed;
	if (angle > 360)
	    angle -= 360;
}

//Clamp the turning speed of the platform;
turn_speed = clamp(turn_speed, -2, 2);

//For each platform
for (i=0; i<4; i++) {
	
	var oldx = 0;
	var oldy = 0;
	
	//For each platform
	with (platform[i]) {
	
		//Check for the player
		if (collision_rectangle(bbox_left+1, bbox_top-5, bbox_right-1, bbox_top+4, obj_mario, 1, 1))
		&& (obj_mario.state != playerstate.jump)
		&& (obj_mario.bbox_bottom < yprevious+5) {
		
			//Impede platform movement if the platforms touch a solid surface or a slope
			if ((!collision_rectangle(obj_mario.x-9, obj_mario.bbox_top, obj_mario.x+9, obj_mario.bbox_bottom, obj_solid, 1, 1)) 
			&& (!collision_rectangle(obj_mario.x-9, obj_mario.bbox_top, obj_mario.x+9, obj_mario.bbox_bottom, obj_slopeparent, 1, 1))) 
			&& (oldx == 0) && (oldy == 0) {

				other.oldx = x;
				other.oldy = y;
				other.turn_speed += 0.002 * (other.x - x);
			}
		}
	}
		
	//Set the position of the platform
	platform[i].x = x+distance*cos((angle+(i*90))*pi/180);
	platform[i].y = y-distance*sin((angle+(i*90))*pi/180);
	
	//If the platforms are moving
	if (oldx > 0) 
	&& (oldy > 0) {
			
		obj_mario.x += (platform[i].x - oldx);
		obj_mario.y += (platform[i].y - oldy);
	}
		
	//Otherwise, slow down the platform until it fully stops
	else {
		
		turn_speed = max(0, abs(turn_speed)-0.01)*sign(turn_speed);
		if (abs(turn_speed) < 0.01)
			turn_speed = 0;
	}
	
	//Set the position of the centre point
	x -= (turn_speed/wheel_speed);
}
   
//Prevent the platform from moving over the given limits
if (x < xmin)
	x = xmin;
else if (x > xmax)
	x = xmax;