/// @description Warp to the destination room

//Set exit type
global.postchange = 1;

//Set exit direction
global.exit_dir = exit_dir;

//Set warp id
global.exit_id = exit_id;

//If the pipe does not lead to a different room
if (destination == noone)
    with (obj_warp_node) event_user(0);
else {
	
	//If no curtain exists
	if (instance_number(obj_fade_in) == 0) {
	
		with (instance_create_depth(0, 0, -100, obj_fade_in))
			target = other.destination;
	}
}