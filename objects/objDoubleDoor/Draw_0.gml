if ( bDrawGear )
{
	var fGearAngle = ( x - xstart ) * fGearSpeed;
	draw_sprite_ext( sprGear, 0, fGearX, fGearY, 1, 1, fGearAngle, c_white, 1 );
}

draw_self();
