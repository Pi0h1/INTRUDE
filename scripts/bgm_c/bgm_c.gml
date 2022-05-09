function CBgm() constructor
{
	static s_iAudio = -1;
}



function BgmPlay( iSound )
{
	static Bgm = new CBgm();
	
	if audio_is_playing( Bgm.s_iAudio )
		audio_stop_sound( Bgm.s_iAudio );
	Bgm.s_iAudio = audio_play_sound( iSound, 1, true )
}


function BgmStop()
{
	static Bgm = new CBgm();
	audio_stop_sound( Bgm.s_iAudio );
}
