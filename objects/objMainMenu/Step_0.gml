if	fade > 0 {
	fade -= 0.02
}

if (gamepad_button_check(0,gp_start)) {
	room_goto_next();
}