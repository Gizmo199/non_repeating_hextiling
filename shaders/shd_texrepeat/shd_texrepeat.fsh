varying vec2	v_vTexcoord;
varying vec4	v_vColour;

uniform vec2	tex_repeat;
uniform float	hex_size;
uniform float	sharpness;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord * tex_repeat);
}
