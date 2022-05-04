

if place_meeting(x,y+1,objWater){

/*
gpu_set_fog(true,merge_colour(c_aqua,c_white,75),1,1)
draw_sprite_ext(sprite_index,image_index,x+lengthdir_x(1+4,dir+4),y+4,image_xscale-.75,image_yscale,image_angle,image_blend,.25);
draw_sprite_ext(sprite_index,image_index,x+lengthdir_x(1+3,dir+3),y+3,image_xscale-.5,image_yscale,image_angle,image_blend,.5);
draw_sprite_ext(sprite_index,image_index,x+lengthdir_x(1+2,dir+2),y+2,image_xscale-.25,image_yscale,image_angle,image_blend,.75);
draw_sprite_ext(sprite_index,image_index,x+lengthdir_x(1,dir),y+1,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
dir+=2
gpu_set_fog(false,c_white,1,1)
*/

if object_index!=objBrick{
draw_sprite_ext(sprite_index,image_index,x,y+16,image_xscale,image_yscale,image_angle,image_blend,0.5);
}

gpu_set_fog(true,merge_colour(c_aqua,c_white,75),1,1)
draw_sprite_ext(sprite_index,image_index,x,y+1,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
gpu_set_fog(false,c_white,1,1)
}

if image_yscale<1 or object_index=(objWallBright){}else{
draw_sprite_ext(sprite_index,image_index,x,y+8,image_xscale,image_yscale,image_angle,c_black,0.5);
}

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
