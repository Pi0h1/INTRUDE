darkenSprite=false;
shadowAlpha=0;
shadowSpeed=0.01;
shadowTotal=0.5;
event_inherited();

// Sprites
Sprites = {};
Sprites.Idle 		= new CardinalSprite( [ sprSnakeRight, sprSnakeUp, sprSnakeLeft, sprSnakeDown ] );
Sprites.Walk 		= new CardinalSprite( [ sprSnakeRightWalk, sprSnakeUpWalk, sprSnakeLeftWalk, sprSnakeDownWalk ] );
Sprites.WalkSlow 	= new CardinalSprite( [ sprSnakeRightWalk, sprSnakeUpWalk, sprSnakeLeftWalk, sprSnakeDownWalk ] );
Sprites.Punch 		= new CardinalSprite( [ sprPlayerPunchRight,sprPlayerPunchUp, sprPlayerPunchLeft, sprPlayerPunchDown ] );