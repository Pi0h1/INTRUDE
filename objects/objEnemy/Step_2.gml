switch nState
{
	case E_STATE.PATROL:
	case E_STATE.PATROL_LEFT:
	case E_STATE.PATROL_RIGHT:
		if ( fXsp == 0 && fYsp == 0 )
		{
			sprite_index = GetCardinalSprite( "Idle" );
			image_index = 0;
		}
		else
		{
			sprite_index = GetCardinalSprite( "Walk" );
			
			
			image_index += ( fSpeedDistance * ( sprite_get_speed( sprite_index ) / 144 ) * delta );
		}
		
		break;
}
