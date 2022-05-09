event_inherited();

enum E_STATE
{
	STATIC,
	PATROL,
	PATROL_LEFT,
	PATROL_RIGHT,
	ALERT,
	CHASE,
	SLEEPING,
}

iState = 0;
iMainState = 0;

fnMainState = fnState;

fHomeX = x;
fHomeY = y;

fSeeRange = 8 * 14;
fSeeRadius = 4;

fPatrolWait = 0;
fPatrolTimer = -1;

Sprites.Idle = new CardinalSprite( [ sprEnemyCommonIdleRight, sprEnemyCommonIdleUp, sprEnemyCommonIdleLeft, sprEnemyCommonIdleDown ] );
Sprites.Walk = new CardinalSprite( [ sprEnemyCommonWalkRight, sprEnemyCommonWalkUp, sprEnemyCommonWalkLeft, sprEnemyCommonWalkDown ] );
