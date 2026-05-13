/// @description Draw a line

draw_set_alpha(0.5);
draw_line_colour(xmin, ystart + 8, xmax, ystart + 8, c_red, c_red);
draw_set_alpha(1);

//Debug
draw_text(x + 16, y, string(turn_speed));