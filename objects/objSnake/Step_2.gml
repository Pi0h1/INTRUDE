switch nState
{
	case P_STATE.DEFAULT:
		if ( fXsp == 0 && fYsp == 0 )
		{
			sprite_index = GetSprite( "Idle" );
			image_index = 0;
		}
		else
		{
			if ( fSpeedDistance < 0.5 )
				sprite_index = GetSprite( "Punch" );
			else
				sprite_index = GetSprite( "Walk" );
			
			
			image_index += ( fSpeedDistance * ( sprite_get_speed( sprite_index ) / 144 ) * delta );
		}
		
		break;
}
