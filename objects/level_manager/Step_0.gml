if(!audio_is_playing(music_intro) && !loopPart){
	audio_play_sound(music_loop, 1, true);
	loopPart = true;
}