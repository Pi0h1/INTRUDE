// AI scripts for the enemies
// the enemy is effectively a player and the AI should determine their inputs

function AI_EnemyGeneric()
{
	switch nState
	{
		case E_STATE.PATROL_LEFT:
		case E_STATE.PATROL_RIGHT:
		case E_STATE.PATROL:
			
			// Walk in a straight line until colliding with something, then turn based on the state
			//
			
			if ( fPatrolTimer < 0 )
			{
				cThrottle.m_fScale = 0.66;
				if ( bWallTouching )
				{
					fPatrolTimer = 0;
					cThrottle.m_fScale = 0;
					
				}
			}
			else
			{
				fPatrolTimer += delta
				if ( fPatrolTimer >= fPatrolWait )
				{
					fPatrolTimer = -1;
					
					if ( nState == E_STATE.PATROL_LEFT )
						cThrottle.m_fDirection += 90;
					else if ( nState == E_STATE.PATROL_RIGHT )
						cThrottle.m_fDirection -= 90;
					else
						cThrottle.m_fDirection += 180;
					
				}
			}
			
			break;
	}
}

// Set the current state, and main state of an enemy; which they will return to after being disturbed
//

function AI_EnemySetSpawnState( state )
{
	nState = state;
	nMainState = state;
}