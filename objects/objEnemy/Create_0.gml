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

nState = 0;
nMainState = 0;

fHomeX = x;
fHomeY = y;

fSeeRange = 8 * 14;
fSeeRadius = 4;

fPatrolWait = 0;
fPatrolTimer = -1;

cSprites.Idle = new CardinalSprite( [ sprEnemyCommonIdleRight, sprEnemyCommonIdleUp, sprEnemyCommonIdleLeft, sprEnemyCommonIdleDown ] );
cSprites.Walk = new CardinalSprite( [ sprEnemyCommonWalkRight, sprEnemyCommonWalkUp, sprEnemyCommonWalkLeft, sprEnemyCommonWalkDown ] );
