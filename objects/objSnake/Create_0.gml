event_inherited();
//if !instance_exists(objCursor){instance_create(x,y,objCursor)}

enum P_STATE
{
	DEFAULT,
	CROUCH,
	CRAWL,
}

// Sprites
cSprites = {};
cSprites.Idle = new CardinalSprite( [ sprPlayerIdleRight, sprPlayerIdleUp, sprPlayerIdleLeft, sprPlayerIdleDown ] );
cSprites.Walk = new CardinalSprite( [ sprPlayerWalkRight, sprPlayerWalkUp, sprPlayerWalkLeft, sprPlayerWalkDown ] );
cSprites.WalkSlow = new CardinalSprite( [ sprPlayerWalkRight, sprPlayerWalkUp, sprPlayerWalkLeft, sprPlayerWalkDown ] );
cSprites.Punch = new CardinalSprite( [ sprPlayerPunchRight,sprPlayerPunchUp, sprPlayerPunchLeft, sprPlayerPunchDown ] );
