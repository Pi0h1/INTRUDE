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
cSprites.Idle = new CardinalSprite( [ sprSnakeRight, sprSnakeUp, sprSnakeLeft, sprSnakeDown ] );
cSprites.Walk = new CardinalSprite( [ sprSnakeRightWalk, sprSnakeUpWalk, sprSnakeLeftWalk, sprSnakeDownWalk ] );
cSprites.WalkSlow = new CardinalSprite( [ sprSnakeRightWalk, sprSnakeUpWalk, sprSnakeLeftWalk, sprSnakeDownWalk ] );
cSprites.Punch = new CardinalSprite( [ sprPlayerPunchRight,sprPlayerPunchUp, sprPlayerPunchLeft, sprPlayerPunchDown ] );
