switch nState
{
	case P_STATE.DEFAULT:
		if ( fXsp == 0 && fYsp == 0 )
		{
			sprite_index = GetCardinalSprite( "Idle" );
			image_index = 0;
		}
		else
		{
			if ( fSpeedDistance < 0.5 )
				sprite_index = GetCardinalSprite( "WalkSlow" );
			else
				sprite_index = GetCardinalSprite( "Walk" );
			
			
			image_index += ( fSpeedDistance * ( sprite_get_speed( sprite_index ) / 144 ) * delta );
		}
		
		break;
}






