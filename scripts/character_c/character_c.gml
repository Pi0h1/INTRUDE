function CharacterMove()
{
	var xmove = fXsp * delta;
	var ymove = fYsp * delta;
	var inst;
	
	var destx = x + xmove;
	var desty = y + ymove;
	
	if ( xmove > 0 )
	{
		if place_free( destx, y )
			x = destx;
		else
		{
			inst = instance_place( destx, y, objSolid );
			if instance_exists( inst )
			{
				x = floor( inst.bbox_left - ( bbox_right - x ) );
			}
			fXsp = 0;
		}
	}
	else if ( xmove < 0 )
	{
		if place_free( destx, y )
			x = destx;
		else
		{
			inst = instance_place( destx, y, objSolid );
			if instance_exists( inst )
			{
				x = ceil( inst.bbox_right + ( x - bbox_left ) );
			}
			fXsp = 0;
		}
	}
	
	if ( ymove > 0 )
	{
		if place_free( x, desty )
			y = desty;
		else
		{
			inst = instance_place( x, desty, objSolid );
			if instance_exists( inst )
			{
				y = floor( inst.bbox_top - ( bbox_bottom - y ) );
			}
			fYsp = 0;
		}
	}
	else if ( ymove < 0 )
	{
		if place_free( x, desty )
			y = desty;
		else
		{
			inst = instance_place( x, desty, objSolid );
			if instance_exists( inst )
			{
				y = ceil( inst.bbox_bottom + ( y - bbox_top ) );
			}
			fYsp = 0;
		}
	}
}

function CharacterThrottle()
{
	var spd_dir = point_direction( 0, 0, fXsp, fYsp  );
	
	var dest_xsp = dcos( cThrottle.m_fDirection ) * cThrottle.m_fScale * fSpeed;
	var dest_ysp = -dsin( cThrottle.m_fDirection ) * cThrottle.m_fScale * fSpeed;

	if true
	{
		var dest_dir = point_direction( fXsp, fYsp, dest_xsp, dest_ysp );
		var dest_dis = point_distance( fXsp, fYsp, dest_xsp, dest_ysp );
		var amount = max( 0, abs( angle_difference( spd_dir, dest_dir ) ) - 90 ) / 180;
		
		var inc = lerp( fAcceleration * cThrottle.m_fScale, fDeceleration, amount ) * fFriction;
	
		if ( dest_dis < inc )
		{
			fXsp = dest_xsp;
			fYsp = dest_ysp;
		}
		else
		{
			fXsp += dcos( dest_dir ) * inc * delta;
			fYsp -= dsin( dest_dir ) * inc * delta;
		}
	}
	else
	{
		fXsp = dest_xsp;
		fYsp = dest_ysp;
	}
}