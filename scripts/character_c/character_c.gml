function CCharacterThrottle() constructor
{
	m_fAxisH = 0;
	m_fAxisV = 0;
	m_fDirection = 0;
	m_fScale = 0;
}


function CharacterThrottle()
{
	
	if !( bCanMove )
	{
		Throttle.m_fScale = 0;
	}
	
	var spd_dir = point_direction( 0, 0, fXsp, fYsp  );
	
	var dest_xsp = dcos( Throttle.m_fDirection ) * Throttle.m_fScale * fSpeed;
	var dest_ysp = -dsin( Throttle.m_fDirection ) * Throttle.m_fScale * fSpeed;
	
	if true
	{
		var dest_dir = point_direction( fXsp, fYsp, dest_xsp, dest_ysp );
		var dest_dis = point_distance( fXsp, fYsp, dest_xsp, dest_ysp );
		var amount = max( 0, abs( angle_difference( spd_dir, dest_dir ) ) - 90 ) / 180;
		
		var inc = lerp( fAcceleration * Throttle.m_fScale, fDeceleration, amount ) * fFriction;
	
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


function CharacterMove()
{
	bWallTouching = false;
	iWallTouchingX = 0;
	iWallTouchingY = 0;
	
	if ( bForceStill )
	{
		fXsp = 0;
		fYsp = 0;
	}
	
	
	bGrounded = false;
	fZsp += fWeight * delta;
	
	var xmove = fXsp * delta;
	var ymove = fYsp * delta;
	var zmove = fZsp * delta;
	var inst;
	
	var destx = x + xmove;
	var desty = y + ymove;
	var destz = z + zmove;
	
	instance_deactivate_region( x - 64, y - 64, 128, 128, false, true );
	
	// Z Movement
	
	// X Movement
	
	if ( xmove != 0 )
	{
		inst = instance_place( destx, y, objSolid );
		if ( inst == noone )
		{
			x = destx;
		}
		else
		{
			if ( xmove > 0 )
			{
				x = floor( inst.bbox_left - ( bbox_right - x ) );
			}
			else
			{
				x = ceil( inst.bbox_right + ( x - bbox_left ) );
			}
			
			if ( ymove == 0 ) && place_free( x, y - abs( xmove ) ) && place_free( destx, y - iCornerStep )
			{
				y -= abs( xmove );
			}
			else if ( ymove == 0 ) && place_free( x, y + abs( xmove ) ) && place_free( destx, y + iCornerStep )
			{
				y += abs( xmove );
			}
			else
			{
				bWallTouching = true;
				iWallTouchingX = sign( fXsp );
				fXsp = 0;
			}
			
		}
	}
	
		// Y Movement
	
	if ( ymove != 0 )
	{
		inst = instance_place( x, desty, objSolid );
		if ( inst == noone )
		{
			y = desty;
		}
		else
		{
			if ( ymove > 0 )
			{
				y = floor( inst.bbox_top - ( bbox_bottom - y ) );
			}
			else
			{
				y = ceil( inst.bbox_bottom + ( y - bbox_top ) );
			}
			
			if ( xmove == 0 ) && place_free( x - abs( ymove ), y ) && place_free( x - iCornerStep, desty )
			{
				x -= abs( ymove );
			}
			else if ( xmove == 0 ) && place_free( x + abs( ymove ), y ) && place_free( x + iCornerStep, desty )
			{
				x += abs( ymove );
			}
			else
			{
				bWallTouching = true;
				iWallTouchingY = sign( fYsp );
				fYsp = 0;
			}
		}
	}
	
	instance_activate_all();
	
	depth = -y;

	fSpeedDirection = point_direction( 0, 0, fXsp, fYsp );
	fSpeedDistance = point_distance( 0, 0, fXsp, fYsp );

	if ( fSpeedDistance != 0 )
		CharacterLookDirection( fSpeedDirection );

}


function CharacterLookDirection( fDirection )
{
	self.fDirection = fDirection;
	iCardinal = round( fDirection / 45 );
}


function CharacterPlayerInput()
{
	Throttle.m_fAxisH = PlayerInput.ThrottleX;
	Throttle.m_fAxisV = PlayerInput.ThrottleY;
	Throttle.m_fDirection = PlayerInput.ThrottleDirection;
	Throttle.m_fScale = PlayerInput.ThrottleScale;
}
