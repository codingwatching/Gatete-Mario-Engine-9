/// @description Panser fireball

//Inherit event
event_inherited();

//Ignore moving platforms
ignore_platforms = true;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
	with (mylight) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}
