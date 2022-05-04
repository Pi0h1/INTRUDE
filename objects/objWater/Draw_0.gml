draw_rectangle_color(x,y+32,x+(sprite_width*image_xscale),y+(sprite_width*image_yscale),c_black,c_black,c_black,c_black,0)

gpu_set_blendmode(bm_subtract)
draw_rectangle_color(x,y,x+(sprite_width*image_xscale),y+32,c_black,c_black,c_white,c_white,0)

gpu_set_blendmode(bm_normal)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
gpu_set_blendmode(bm_normal)

gpu_set_blendmode(bm_add)
draw_sprite_ext(sprNoise,1,x+random(32),y+random(8),image_xscale,image_yscale,choose(0,90,180,270),image_blend,0.2);
gpu_set_blendmode(bm_normal)
