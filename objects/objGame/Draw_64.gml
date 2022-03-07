/// @description  Black fade-in

if fade > 0 {fade-=fadespeed}

draw_set_alpha(fade)
draw_rectangle_colour(0,0,display_get_width()+16,display_get_height()+16,c_black,c_black,c_black,c_black,0);
draw_set_alpha(1)