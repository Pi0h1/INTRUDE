draw_self();

draw_set_color( c_blue );
draw_rectangle( bbox_left, bbox_bottom, bbox_right, bbox_bottom - fHeight, true );

draw_set_color( c_aqua );
draw_rectangle( bbox_left, bbox_top - fHeight, bbox_right, bbox_bottom - fHeight, true );