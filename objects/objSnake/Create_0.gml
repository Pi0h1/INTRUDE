//if !instance_exists(objCursor){instance_create(x,y,objCursor)}
fade=1
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
	CROUCH,
	CRAWL,
}

fSpeed = 15;
fAcceleration = 0.05;
fDeceleration = 1;
fFriction = 1;
fXsp = 0;
fYsp = 0;

fHeight = 25;

nState = P_STATE.DEFAULT;

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

