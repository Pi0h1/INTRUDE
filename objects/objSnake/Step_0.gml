if ( bForceStill )
{
	fXsp = 0;
	fYsp = 0;
}
else
{
	var bGamepad = gamepad_is_connected( 0 );
	
	#region Throttle Input
	if ( bCanMove )
	{
		if ( bGamepad )
		{
			var fGamepadAxisH = gamepad_axis_value( 0, gp_axislh );
			var fGamepadAxisV = gamepad_axis_value( 0, gp_axislv );
			
			
			
		}
	
		if ( bGamepad && abs( fGamepadAxisH ) > cThrottle.m_fDeadZone )
			cThrottle.m_fAxisH = ( fGamepadAxisH ) ;
		else
			cThrottle.m_fAxisH = ( keyboard_check( cControls.MoveRight ) - keyboard_check( cControls.MoveLeft ) );
		if ( bGamepad && abs( fGamepadAxisV ) > cThrottle.m_fDeadZone )
			cThrottle.m_fAxisV = fGamepadAxisV;
		else
			cThrottle.m_fAxisV = ( keyboard_check( cControls.MoveDown ) - keyboard_check( cControls.MoveUp ) );
	
		cThrottle.m_fDirection = point_direction( 0, 0, cThrottle.m_fAxisH, cThrottle.m_fAxisV );
		if ( bGamepad )
		{
			var snap_angle = ( round( cThrottle.m_fDirection / 45 ) * 45 );
			if ( cThrottle.m_fDirection > snap_angle - ( cThrottle.m_fSnapRange / 2 ) && cThrottle.m_fDirection < snap_angle + ( cThrottle.m_fSnapRange / 2 ) )
				cThrottle.m_fDirection = snap_angle;
		}
		cThrottle.m_fScale = min( 1, point_distance( 0, 0, cThrottle.m_fAxisH, cThrottle.m_fAxisV ) );
	}
	else
	{
		cThrottle.m_fAxisH = 0;
		cThrottle.m_fAxisV = 0;
		cThrottle.m_fScale = 0;
	}
	#endregion
	
	
	var spd_dir = point_direction( 0, 0, fXsp, fYsp  );
	
	var dest_xsp = dcos( cThrottle.m_fDirection ) * cThrottle.m_fScale * fSpeed;
	var dest_ysp = -dsin( cThrottle.m_fDirection ) * cThrottle.m_fScale * fSpeed;

	if true
	{
		var dest_dir = point_direction( fXsp, fYsp, dest_xsp, dest_ysp );
		var dest_dis = point_distance( fXsp, fYsp, dest_xsp, dest_ysp );
		var amount = abs( angle_difference( spd_dir, dest_dir ) ) / 180;
		
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


var xmove = fXsp * delta;
var ymove = fYsp * delta;

if ( xmove > 0 )
{
	if place_free( x + xmove, y )
		x += xmove;
	else
	{
		fXsp = 0;
	}
}
else if ( xmove < 0 )
{
	if place_free( x + xmove, y )
		x += xmove;
	else
	{
		fXsp = 0;
	}
}

if ( ymove > 0 )
{
	if place_free( x, y + ymove )
		y += ymove;
	else
	{
		fYsp = 0;
	}
}
else if ( ymove < 0 )
{
	if place_free( x, y + ymove )
		y += ymove;
	else
	{
		fYsp = 0;
	}
}

depth = -y;

fSpeedDirection = point_direction( 0, 0, fXsp, fYsp );
fSpeedDistance = point_distance( 0, 0, fXsp, fYsp );

if ( fSpeedDistance != 0 )
	fDirection = fSpeedDirection;

fCardinal = round( fDirection / 45 );