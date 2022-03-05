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

nCornerStep = 6;

fSpeed = 1;
fAcceleration = 0.66;
fDeceleration = 0.25;
fFriction = 1;

fHeight = 25;
fWeight = 0.33;

cThrottle = new CCharacterThrottle();

bCanMove = true;
bForceStill = false;
bGrounded = true;

bWallTouching = false;
nWallTouchingX = 0;
nWallTouchingY = 0;

nCardinal = 0;
fDirection = 0;
fSpeedDirection = 0;
fSpeedDistance = 0;

nState = 0;

// Sprites
cSprites = {};

if ( image_angle != 0 )
{
	fDirection = image_angle;
	fSpeedDirection = image_angle;
	nCardinal = round( fDirection / 8 );
	image_angle = 0;
}