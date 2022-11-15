shader_set_ext(actv ? shd_nonrepeat : shd_texrepeat,{
	tex_repeat	: [reps, reps],
	sharpness	: shrp,
	hex_size	: size,
});
draw_self();
shader_reset();

draw_text(5, 5, "[SPACE] Active: "+string(actv? "on":"off")+"\n[LMB][RMB]"+string(image_index)+"\n[WHEEL] Texrepeat: "+string(reps)+"\n[Q][A] Sharpness: "+string(shrp)+"\n[W][S] Hex Size: "+string(size));