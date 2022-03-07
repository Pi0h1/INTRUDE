var start = (gamepad_button_check(0,gp_start)) || (keyboard_check(vk_enter));
if (start){
room_goto(goal);
}