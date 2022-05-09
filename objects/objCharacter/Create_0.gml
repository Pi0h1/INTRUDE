enum CARDINAL
{
	E,
	NE,
	N,
	NW,
	W,
	SW,
	S,
	SE,
}

mask_index = sprPlayerCollision;

z = 0;

fXsp = 0;
fYsp = 0;
fZsp = 0;

iCornerStep = 9;

fSpeed = 1;
fAcceleration = 0.66;
fDeceleration = 0.25;
fFriction = 1;

fHeight = 25;
fWeight = 0.33;

Throttle = new CCharacterThrottle();

bCanMove = true;
bForceStill = false;
bGrounded = true;

bWallTouching = false;
iWallTouchingX = 0;
iWallTouchingY = 0;

if ( image_xscale != 1 )
{
	image_xscale = 1;
	if ( fStartDirection != 0 )
		fStartDirection = 270;
}

if ( image_angle != 0 )
{
	image_angle = 0;
	fStartDirection = image_angle;
}

fDirection = fStartDirection;
iCardinal = round( fDirection / 45 );
fSpeedDirection = 0;
fSpeedDistance = 0;

iState = 0;

iKeycardLevel = 0;

// Sprites
Sprites = {};
