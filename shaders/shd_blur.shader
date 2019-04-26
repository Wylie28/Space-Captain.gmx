attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~


varying vec2 v_texcoord;

//uniform float time;
//uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float blur_amount;

void main()
{ 
    float blurSizex = 1.0/resolution.x * blur_amount;
    float blurSizey = 1.0/resolution.y * blur_amount;
   vec4 sum = vec4(0.0);
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x - 4.0*blurSizex, v_texcoord.y - 4.0*blurSizey)) * 0.05;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x - 3.0*blurSizex, v_texcoord.y - 3.0*blurSizey)) * 0.09;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x - 2.0*blurSizex, v_texcoord.y - 2.0*blurSizey)) * 0.12;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x - blurSizex, v_texcoord.y - blurSizey)) * 0.15;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y)) * 0.16;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x + blurSizex, v_texcoord.y + blurSizey)) * 0.15;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x + 2.0*blurSizex, v_texcoord.y + 2.0*blurSizey)) * 0.12;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x + 3.0*blurSizex, v_texcoord.y + 3.0*blurSizey)) * 0.09;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x + 4.0*blurSizex, v_texcoord.y + 4.0*blurSizey)) * 0.05;
    gl_FragColor = sum;
}