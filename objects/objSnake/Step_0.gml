if fade > 0 {fade -= 0.05}

if ( bForceStill )
{
	fXsp = 0;
	fYsp = 0;
}
else
{
	InputPlayerThrottle();
	
	CharacterThrottle();
}

CharacterMove();

depth = -y;

fSpeedDirection = point_direction( 0, 0, fXsp, fYsp );
fSpeedDistance = point_distance( 0, 0, fXsp, fYsp );

if ( fSpeedDistance != 0 )
	fDirection = fSpeedDirection;

fCardinal = round( fDirection / 45 );
