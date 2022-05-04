function BgmPlay( iSound )
{
	static s_iAudio = -1;
	if audio_is_playing( s_iAudio )
		audio_stop_sound( s_iAudio );
	s_iAudio = audio_play_sound( iSound, 1, true )
}

