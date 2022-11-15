var ipt_tiling = mouse_wheel_up() - mouse_wheel_down();
var ipt_sharp  = keyboard_check_pressed(ord("Q")) - keyboard_check_pressed(ord("A"));
var ipt_sizing = keyboard_check_pressed(ord("W")) - keyboard_check_pressed(ord("S"));
var ipt_active = keyboard_check_pressed(vk_space);

reps += ipt_tiling;
shrp += ipt_sharp;
size += ipt_sizing;
image_index += mouse_check_button_pressed(mb_left) - mouse_check_button_pressed(mb_right);


if ( ipt_active ) actv = !actv;

reps = clamp(reps, 1, 1000);
shrp = clamp(shrp, 1, 1000);
size = clamp(size, 1, 1000);