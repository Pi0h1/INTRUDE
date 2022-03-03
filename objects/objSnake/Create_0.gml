//if !instance_exists(objCursor){instance_create(x,y,objCursor)}

globalvar delta; delta = 1;

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

enum P_STATE
{
	DEFAULT,
}

fSpeed = 1;
fAcceleration = 0.75;
fDeceleration = 0.25;
fFriction = 1;
fXsp = 0;
fYsp = 0;

nState = 0;

bCanMove = true;
bForceStill = false;

fCardinal = 0;
fDirection = 0;
fSpeedDirection = 0;
fSpeedDistance = 0;

// Throttle
cThrottle = {};
cThrottle.m_fDeadZone = 17.5 / 100;
cThrottle.m_fSnapRange = 25;
cThrottle.m_fAxisH = 0;
cThrottle.m_fAxisV = 0;
cThrottle.m_fDirection = 0;
cThrottle.m_fScale = 0;

// Sprites
cSprites = {};
cSprites.Idle = new CardinalSprite( [ sprPlayerIdleRight, sprPlayerIdleUp, sprPlayerIdleLeft, sprPlayerIdleDown ] );
cSprites.Walk = new CardinalSprite( [ sprPlayerWalkRight, sprPlayerWalkUp, sprPlayerWalkLeft, sprPlayerWalkDown ] );
cSprites.WalkSlow = new CardinalSprite( [ sprPlayerWalkRight, sprPlayerWalkUp, sprPlayerWalkLeft, sprPlayerWalkDown ] );
cSprites.Punch = new CardinalSprite( [ sprPlayerPunchRight,sprPlayerPunchUp, sprPlayerPunchLeft, sprPlayerPunchDown ] );

