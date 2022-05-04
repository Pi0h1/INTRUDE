draw_self();

if place_meeting(x,y-1,objSolid){
darkenSprite=true;
} else{
darkenSprite=false;
}

if (darkenSprite){
if shadowAlpha<shadowTotal shadowAlpha += shadowSpeed;
if shadowAlpha>shadowTotal shadowAlpha=shadowTotal
} else {
if shadowAlpha>0 shadowAlpha += -(shadowSpeed*2);
if shadowAlpha<0 shadowAlpha=0
}

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,shadowAlpha);

