// AI scripts for the enemies
// the enemy is effectively a player and the AI should determine their inputs

function AI_EnemyGeneric()
{
	if ( fnState ) && ( fnState != AI_EnemyGeneric )
		fnState();
	
}


function AI_EnemyState_Static()
{
	
}

function AI_EnemyState_Patrol()
{
	// Walk in a straight line until colliding with something, then turn based on the state
	//
			
	if ( fPatrolTimer < 0 )
	{
		Throttle.m_fScale = 0.66;
		if ( bWallTouching )
		{
			fPatrolTimer = 0;
			Throttle.m_fScale = 0;
		}
	}
	else
	{
		fPatrolTimer += delta
		if ( fPatrolTimer >= fPatrolWait )
		{
			fPatrolTimer = -1;
					
			if ( fnState == AI_EnemyState_Patrol_Left )
				Throttle.m_fDirection += 90;
			else if ( fnState == AI_EnemyState_Patrol_Right )
				Throttle.m_fDirection -= 90;
			else
				Throttle.m_fDirection += 180;
					
		}
	}
}


function AI_EnemyState_Patrol_Left()
{
	AI_EnemyState_Patrol();
}


function AI_EnemyState_Patrol_Right()
{
	AI_EnemyState_Patrol();
}

// Set the current state, and main state of an enemy; which they will return to after being disturbed
//
function AI_EnemySetSpawnState( fnState )
{
	self.fnState = fnState;
	fnMainState = fnState;
}