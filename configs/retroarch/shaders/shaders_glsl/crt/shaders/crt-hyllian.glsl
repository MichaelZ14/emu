#pragma parameter PHOSPHOR "CRT - Phosphor ON/OFF" 1.0 0.0 1.0 1.0
#pragma parameter InputGamma "CRT - Input gamma" 2.4 0.0 5.0 0.1
#pragma parameter OutputGamma "CRT - Output Gamma" 2.2 0.0 5.0 0.1
#pragma parameter SHARPNESS "CRT - Sharpness Hack" 1.0 1.0 5.0 1.0
#pragma parameter COLOR_BOOST "CRT - Color Boost" 1.5 1.0 2.0 0.05
#pragma parameter RED_BOOST "CRT - Red Boost" 1.0 1.0 2.0 0.01
#pragma parameter GREEN_BOOST "CRT - Green Boost" 1.0 1.0 2.0 0.01
#pragma parameter BLUE_BOOST "CRT - Blue Boost" 1.0 1.0 2.0 0.01
#pragma parameter SCANLINES_STRENGTH "CRT - Scanline Strength" 0.72 0.0 1.0 0.02
#pragma parameter BEAM_MIN_WIDTH "CRT - Min Beam Width" 0.86 0.0 1.0 0.02
#pragma parameter BEAM_MAX_WIDTH "CRT - Max Beam Width" 1.0 0.0 1.0 0.02
#pragma parameter CRT_ANTI_RINGING "CRT - Anti-Ringing" 0.8 0.0 1.0 0.1
#ifdef PARAMETER_UNIFORM
uniform float PHOSPHOR;
uniform float InputGamma;
uniform float OutputGamma;
uniform float SHARPNESS;
uniform float COLOR_BOOST;
uniform float RED_BOOST;
uniform float GREEN_BOOST;
uniform float BLUE_BOOST;
uniform float SCANLINES_STRENGTH;
uniform float BEAM_MIN_WIDTH;
uniform float BEAM_MAX_WIDTH;
uniform float CRT_ANTI_RINGING;
#else
#define PHOSPHOR 1.0
#define InputGamma 2.4
#define OutputGamma 2.2
#define SHARPNESS 1.0
#define COLOR_BOOST 1.5
#define RED_BOOST 1.0
#define GREEN_BOOST 1.0
#define BLUE_BOOST 1.0
#define SCANLINES_STRENGTH 0.72
#define BEAM_MIN_WIDTH 0.86
#define BEAM_MAX_WIDTH 1.0
#define CRT_ANTI_RINGING 0.8 
#endif
// END PARAMETERS //

/* COMPATIBILITY
   - HLSL compilers
   - Cg   compilers
*/

/*
   Hyllian's CRT Shader
  
   Copyright (C) 2011-2016 Hyllian - sergiogdb@gmail.com

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
   THE SOFTWARE.

*/


#define GAMMA_IN(color)     pow(color, vec3(InputGamma, InputGamma, InputGamma))
#define GAMMA_OUT(color)    pow(color, vec3(1.0 / OutputGamma, 1.0 / OutputGamma, 1.0 / OutputGamma))

// Horizontal cubic filter.

// Some known filters use these values:

//    B = 0.0, C = 0.0  =>  Hermite cubic filter.
//    B = 1.0, C = 0.0  =>  Cubic B-Spline filter.
//    B = 0.0, C = 0.5  =>  Catmull-Rom Spline filter. This is the default used in this shader.
//    B = C = 1.0/3.0   =>  Mitchell-Netravali cubic filter.
//    B = 0.3782, C = 0.3109  =>  Robidoux filter.
//    B = 0.2620, C = 0.3690  =>  Robidoux Sharp filter.
//    B = 0.36, C = 0.28  =>  My best config for ringing elimination in pixel art (Hyllian).


// For more info, see: http://www.imagemagick.org/Usage/img_diagrams/cubic_survey.gif

// Change these params to configure the horizontal filter.
const float  B =  0.0; 
const float  C =  0.5;  

const  mat4 invX = mat4(                          (-B - 6.0*C)/6.0,   (12.0 - 9.0*B - 6.0*C)/6.0,  -(12.0 - 9.0*B - 6.0*C)/6.0,   (B + 6.0*C)/6.0,
                                              (3.0*B + 12.0*C)/6.0, (-18.0 + 12.0*B + 6.0*C)/6.0, (18.0 - 15.0*B - 12.0*C)/6.0,                -C,
                                              (-3.0*B - 6.0*C)/6.0,                          0.0,          (3.0*B + 6.0*C)/6.0,               0.0,
                                                             B/6.0,            (6.0 - 2.0*B)/6.0,                        B/6.0,               0.0);


#define texCoord TEX0

#if defined(VERTEX)

#if __VERSION__ >= 130
#define OUT out
#define IN  in
#define tex2D texture
#else
#define OUT varying 
#define IN attribute 
#define tex2D texture2D
#endif

#ifdef GL_ES
#define PRECISION mediump
#else
#define PRECISION
#endif


IN  vec4 VertexCoord;
IN  vec4 Color;
IN  vec2 TexCoord;
OUT vec4 color;
OUT vec2 texCoord;

uniform mat4 MVPMatrix;
uniform int  FrameDirection;
uniform int  FrameCount;
uniform PRECISION vec2 OutputSize;
uniform PRECISION vec2 TextureSize;
uniform PRECISION vec2 InputSize;

void main()
{
    gl_Position = MVPMatrix * VertexCoord;
    color = Color;
    texCoord = TexCoord;
}


#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define IN in
#define tex2D texture
out vec4 FragColor;
#else
#define IN varying
#define FragColor gl_FragColor
#define tex2D texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define PRECISION mediump
#else
#define PRECISION
#endif

uniform int FrameDirection;
uniform int FrameCount;
uniform PRECISION vec2 OutputSize;
uniform PRECISION vec2 TextureSize;
uniform PRECISION vec2 InputSize;
uniform sampler2D s_p;
IN vec2 texCoord;


void main()
{
    vec2 texture_size = vec2(SHARPNESS*TextureSize.x, TextureSize.y);

    vec3 color;
    vec2 dx = vec2(1.0/texture_size.x, 0.0);
    vec2 dy = vec2(0.0, 1.0/texture_size.y);
    vec2 pix_coord = texCoord*texture_size+vec2(-0.5,0.5);

    vec2 tc = (floor(pix_coord)+vec2(0.5,0.5))/texture_size;

    vec2 fp = fract(pix_coord);

    vec3 c00 = GAMMA_IN(tex2D(s_p, tc     - dx - dy).xyz);
    vec3 c01 = GAMMA_IN(tex2D(s_p, tc          - dy).xyz);
    vec3 c02 = GAMMA_IN(tex2D(s_p, tc     + dx - dy).xyz);
    vec3 c03 = GAMMA_IN(tex2D(s_p, tc + 2.0*dx - dy).xyz);
    vec3 c10 = GAMMA_IN(tex2D(s_p, tc     - dx).xyz);
    vec3 c11 = GAMMA_IN(tex2D(s_p, tc         ).xyz);
    vec3 c12 = GAMMA_IN(tex2D(s_p, tc     + dx).xyz);
    vec3 c13 = GAMMA_IN(tex2D(s_p, tc + 2.0*dx).xyz);

    //  Get min/max samples
    vec3 min_sample = min(min(c01,c11), min(c02,c12));
    vec3 max_sample = max(max(c01,c11), max(c02,c12));

    mat4x3 color_matrix0 = mat4x3(c00, c01, c02, c03);
    mat4x3 color_matrix1 = mat4x3(c10, c11, c12, c13);

    vec4 lobes = vec4(fp.x*fp.x*fp.x, fp.x*fp.x, fp.x, 1.0);

    vec4 invX_Px  = invX * lobes;
    vec3 color0   = color_matrix0 * invX_Px;
    vec3 color1   = color_matrix1 * invX_Px;

    // Anti-ringing
    vec3 aux = color0;
    color0 = clamp(color0, min_sample, max_sample);
    color0 = mix(aux, color0, CRT_ANTI_RINGING);
    aux = color1;
    color1 = clamp(color1, min_sample, max_sample);
    color1 = mix(aux, color1, CRT_ANTI_RINGING);

    float pos0 = fp.y;
    float pos1 = 1.0 - fp.y;

    vec3 lum0 = mix(vec3(BEAM_MIN_WIDTH), vec3(BEAM_MAX_WIDTH), color0);
    vec3 lum1 = mix(vec3(BEAM_MIN_WIDTH), vec3(BEAM_MAX_WIDTH), color1);

    vec3 d0 = clamp(pos0/(lum0+0.0000001), 0.0, 1.0);
    vec3 d1 = clamp(pos1/(lum1+0.0000001), 0.0, 1.0);

    d0 = exp(-10.0*SCANLINES_STRENGTH*d0*d0);
    d1 = exp(-10.0*SCANLINES_STRENGTH*d1*d1);

    color = clamp(color0*d0+color1*d1, 0.0, 1.0);            

    color *= COLOR_BOOST*vec3(RED_BOOST, GREEN_BOOST, BLUE_BOOST);

    float mod_factor = texCoord.x * OutputSize.x * TextureSize.x / InputSize.x;

    vec3 dotMaskWeights = mix(
                                 vec3(1.0, 0.7, 1.0),
                                 vec3(0.7, 1.0, 0.7),
                                 floor(mod(mod_factor, 2.0))
                                  );

    color.rgb *= mix(vec3(1.0,1.0,1.0), dotMaskWeights, PHOSPHOR);

    color  = GAMMA_OUT(color);

    FragColor =  vec4(color, 1.0);
}
#endif
