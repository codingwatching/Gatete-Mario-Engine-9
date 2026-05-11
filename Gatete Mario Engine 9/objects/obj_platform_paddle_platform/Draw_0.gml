/// @description Render me

//Draw the chain
for (i=1; i<(parent.distance/16); i++) {
	
    draw_sprite_ext(spr_platform_ferris_chain, 1, parent.x+lengthdir_x(i*16, point_direction(parent.x, parent.y, x, y)), parent.y+lengthdir_y(i*16, point_direction(parent.x, parent.y, x, y)), 1, 1, 0, c_white, 1);
}
draw_sprite_ext(spr_platform_ferris_chain, 0, parent.x, parent.y, 1, 1, 0, c_white, 1);

//Draw the platform
draw_self();