// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying
#define COMPAT_ATTRIBUTE attribute
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 _texCoord;
COMPAT_VARYING     vec4 _color1;
COMPAT_VARYING     vec4 _position1;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec4 _position1;
    vec4 _color1;
    vec2 _texCoord;
};
out_vertex _ret_0;
vec4 _r0008;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 COLOR;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 COL0;
COMPAT_VARYING vec4 TEX0;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    _r0008 = VertexCoord.x*MVPMatrix[0];
    _r0008 = _r0008 + VertexCoord.y*MVPMatrix[1];
    _r0008 = _r0008 + VertexCoord.z*MVPMatrix[2];
    _r0008 = _r0008 + VertexCoord.w*MVPMatrix[3];
    _ret_0._position1 = _r0008;
    _ret_0._color1 = COLOR;
    _ret_0._texCoord = TexCoord.xy;
    gl_Position = _r0008;
    COL0 = COLOR;
    TEX0.xy = TexCoord.xy;
    return;
    COL0 = _ret_0._color1;
    TEX0.xy = _ret_0._texCoord;
} 
#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 _texCoord;
COMPAT_VARYING     vec4 _color;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec4 _color;
    vec2 _texCoord;
};
vec4 _ret_0;
vec4 _TMP49;
vec4 _TMP48;
vec4 _TMP47;
vec4 _TMP46;
float _TMP54;
float _TMP53;
float _TMP52;
float _TMP51;
float _TMP40;
float _TMP38;
float _TMP36;
float _TMP34;
float _TMP32;
float _TMP30;
float _TMP28;
float _TMP26;
float _TMP24;
float _TMP22;
float _TMP20;
float _TMP18;
float _TMP16;
float _TMP14;
float _TMP12;
float _TMP10;
vec4 _TMP39;
vec4 _TMP37;
vec4 _TMP35;
vec4 _TMP33;
vec4 _TMP31;
vec4 _TMP29;
vec4 _TMP27;
vec4 _TMP25;
vec4 _TMP23;
vec4 _TMP21;
vec4 _TMP19;
vec4 _TMP17;
vec4 _TMP15;
vec4 _TMP13;
vec4 _TMP11;
vec4 _TMP9;
float _TMP8;
float _TMP6;
float _TMP4;
float _TMP2;
vec4 _TMP7;
vec4 _TMP5;
vec4 _TMP3;
vec4 _TMP1;
float _TMP0;
uniform sampler2D Texture;
input_dummy _IN1;
float _x0093;
vec2 _c0095;
vec2 _c0099;
vec2 _c0103;
vec2 _c0107;
vec2 _c0111;
vec2 _c0115;
vec2 _c0119;
vec2 _c0123;
vec2 _c0127;
vec2 _c0131;
vec2 _c0135;
vec2 _c0139;
vec2 _c0143;
vec2 _c0147;
vec2 _c0151;
vec2 _c0155;
vec2 _c0159;
vec2 _c0163;
vec2 _c0167;
vec2 _c0171;
vec2 _C0177[2];
vec2 _C0179[2];
vec2 _r0181;
float _TMP190;
float _x0191;
vec2 _c0197;
vec2 _c0199;
vec2 _c0201;
vec2 _c0203;
vec3 _C0205[1];
COMPAT_VARYING vec4 TEX0;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    vec2 _tex;
    vec4 _c0;
    vec2 _R[2];
    vec2 _r;
    vec4 _y1;
    vec2 _a;
    vec3 _TMP60[2];
    vec2 _TMP64[2];
    vec2 _TMP65[4];
    vec2 _TMP66[2];
    vec2 _TMP67[4];
    vec2 _TMP68[4];
    vec2 _TMP69[4];
    _tex = TEX0.xy + vec2(0.00000000E+00, 2.50000000E-01/TextureSize.y);
    _c0 = COMPAT_TEXTURE(Texture, _tex);
    _x0093 = _tex.x*TextureSize.x;
    _TMP0 = fract(_x0093);
    if (_TMP0 < 5.00000000E-01) { 
        FragColor = _c0;
        return;
    } 
    _c0095 = _tex + -vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y);
    _TMP1 = COMPAT_TEXTURE(Texture, _c0095);
    _TMP2 = dot(_TMP1.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0099 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y);
    _TMP3 = COMPAT_TEXTURE(Texture, _c0099);
    _TMP4 = dot(_TMP3.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0103 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, 1.00000000E+00);
    _TMP5 = COMPAT_TEXTURE(Texture, _c0103);
    _TMP6 = dot(_TMP5.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0107 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, -1.00000000E+00);
    _TMP7 = COMPAT_TEXTURE(Texture, _c0107);
    _TMP8 = dot(_TMP7.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _y1 = vec4(_TMP2, _TMP4, _TMP6, _TMP8);
    _c0111 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -3.00000000E+00, -3.00000000E+00);
    _TMP9 = COMPAT_TEXTURE(Texture, _c0111);
    _TMP10 = dot(_TMP9.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0115 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y);
    _TMP11 = COMPAT_TEXTURE(Texture, _c0115);
    _TMP12 = dot(_TMP11.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0119 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -3.00000000E+00, 1.00000000E+00);
    _TMP13 = COMPAT_TEXTURE(Texture, _c0119);
    _TMP14 = dot(_TMP13.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0123 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, -3.00000000E+00);
    _TMP15 = COMPAT_TEXTURE(Texture, _c0123);
    _TMP16 = dot(_TMP15.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0127 = _tex + -vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y);
    _TMP17 = COMPAT_TEXTURE(Texture, _c0127);
    _TMP18 = dot(_TMP17.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0131 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 3.00000000E+00, 3.00000000E+00);
    _TMP19 = COMPAT_TEXTURE(Texture, _c0131);
    _TMP20 = dot(_TMP19.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0135 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, 3.00000000E+00);
    _TMP21 = COMPAT_TEXTURE(Texture, _c0135);
    _TMP22 = dot(_TMP21.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0139 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 3.00000000E+00, -1.00000000E+00);
    _TMP23 = COMPAT_TEXTURE(Texture, _c0139);
    _TMP24 = dot(_TMP23.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0143 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -3.00000000E+00, -1.00000000E+00);
    _TMP25 = COMPAT_TEXTURE(Texture, _c0143);
    _TMP26 = dot(_TMP25.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0147 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, 3.00000000E+00);
    _TMP27 = COMPAT_TEXTURE(Texture, _c0147);
    _TMP28 = dot(_TMP27.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0151 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -3.00000000E+00, 3.00000000E+00);
    _TMP29 = COMPAT_TEXTURE(Texture, _c0151);
    _TMP30 = dot(_TMP29.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0155 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, -1.00000000E+00);
    _TMP31 = COMPAT_TEXTURE(Texture, _c0155);
    _TMP32 = dot(_TMP31.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0159 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, -3.00000000E+00);
    _TMP33 = COMPAT_TEXTURE(Texture, _c0159);
    _TMP34 = dot(_TMP33.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0163 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 3.00000000E+00, 1.00000000E+00);
    _TMP35 = COMPAT_TEXTURE(Texture, _c0163);
    _TMP36 = dot(_TMP35.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0167 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, 1.00000000E+00);
    _TMP37 = COMPAT_TEXTURE(Texture, _c0167);
    _TMP38 = dot(_TMP37.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0171 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 3.00000000E+00, -3.00000000E+00);
    _TMP39 = COMPAT_TEXTURE(Texture, _c0171);
    _TMP40 = dot(_TMP39.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _TMP69[0] = vec2(_TMP10 + _TMP12, _TMP14 + _TMP16);
    _TMP69[1] = vec2(_TMP18 + _TMP20, _TMP22 + _TMP24);
    _TMP69[2] = vec2(_TMP26 + _TMP28, _TMP30 + _TMP32);
    _TMP69[3] = vec2(_TMP34 + _TMP36, _TMP38 + _TMP40);
    _TMP68[0] = 4.00000000E+00*_TMP69[0];
    _TMP68[1] = 4.00000000E+00*_TMP69[1];
    _TMP68[2] = 4.00000000E+00*_TMP69[2];
    _TMP68[3] = 4.00000000E+00*_TMP69[3];
    _C0177[0] = _TMP69[0].x*_TMP68[0] + _TMP69[1].x*_TMP68[1] + _TMP69[2].x*_TMP68[2] + _TMP69[3].x*_TMP68[3];
    _TMP67[0] = 4.00000000E+00*_TMP69[0];
    _TMP67[1] = 4.00000000E+00*_TMP69[1];
    _TMP67[2] = 4.00000000E+00*_TMP69[2];
    _TMP67[3] = 4.00000000E+00*_TMP69[3];
    _C0179[1] = _TMP69[0].y*_TMP67[0] + _TMP69[1].y*_TMP67[1] + _TMP69[2].y*_TMP67[2] + _TMP69[3].y*_TMP67[3];
    _TMP66[0] = _C0177[0];
    _R[1] = _C0179[1];
    _TMP65[0] = 4.00000000E+00*_TMP69[0];
    _TMP65[1] = 4.00000000E+00*_TMP69[1];
    _TMP65[2] = 4.00000000E+00*_TMP69[2];
    _TMP65[3] = 4.00000000E+00*_TMP69[3];
    _r0181 = _y1.x*_TMP65[0];
    _r0181 = _r0181 + _y1.y*_TMP65[1];
    _r0181 = _r0181 + _y1.z*_TMP65[2];
    _r0181 = _r0181 + _y1.w*_TMP65[3];
    _r = _r0181;
    _c0095 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -3.00000000E+00, -1.00000000E+00);
    _TMP1 = COMPAT_TEXTURE(Texture, _c0095);
    _TMP2 = dot(_TMP1.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0099 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 3.00000000E+00, 1.00000000E+00);
    _TMP3 = COMPAT_TEXTURE(Texture, _c0099);
    _TMP4 = dot(_TMP3.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0103 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, 3.00000000E+00);
    _TMP5 = COMPAT_TEXTURE(Texture, _c0103);
    _TMP6 = dot(_TMP5.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0107 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, -3.00000000E+00);
    _TMP7 = COMPAT_TEXTURE(Texture, _c0107);
    _TMP8 = dot(_TMP7.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _y1 = vec4(_TMP2, _TMP4, _TMP6, _TMP8);
    _c0111 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -5.00000000E+00, -3.00000000E+00);
    _TMP9 = COMPAT_TEXTURE(Texture, _c0111);
    _TMP10 = dot(_TMP9.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0115 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, 1.00000000E+00);
    _TMP11 = COMPAT_TEXTURE(Texture, _c0115);
    _TMP12 = dot(_TMP11.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0119 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -5.00000000E+00, 1.00000000E+00);
    _TMP13 = COMPAT_TEXTURE(Texture, _c0119);
    _TMP14 = dot(_TMP13.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0123 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, -3.00000000E+00);
    _TMP15 = COMPAT_TEXTURE(Texture, _c0123);
    _TMP16 = dot(_TMP15.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0127 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, -1.00000000E+00);
    _TMP17 = COMPAT_TEXTURE(Texture, _c0127);
    _TMP18 = dot(_TMP17.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0131 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 5.00000000E+00, 3.00000000E+00);
    _TMP19 = COMPAT_TEXTURE(Texture, _c0131);
    _TMP20 = dot(_TMP19.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0135 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, 3.00000000E+00);
    _TMP21 = COMPAT_TEXTURE(Texture, _c0135);
    _TMP22 = dot(_TMP21.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0139 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 5.00000000E+00, -1.00000000E+00);
    _TMP23 = COMPAT_TEXTURE(Texture, _c0139);
    _TMP24 = dot(_TMP23.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0143 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -3.00000000E+00, 1.00000000E+00);
    _TMP25 = COMPAT_TEXTURE(Texture, _c0143);
    _TMP26 = dot(_TMP25.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0147 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, 5.00000000E+00);
    _TMP27 = COMPAT_TEXTURE(Texture, _c0147);
    _TMP28 = dot(_TMP27.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0151 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -3.00000000E+00, 5.00000000E+00);
    _TMP29 = COMPAT_TEXTURE(Texture, _c0151);
    _TMP30 = dot(_TMP29.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0155 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y);
    _TMP31 = COMPAT_TEXTURE(Texture, _c0155);
    _TMP32 = dot(_TMP31.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0159 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, -5.00000000E+00);
    _TMP33 = COMPAT_TEXTURE(Texture, _c0159);
    _TMP34 = dot(_TMP33.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0163 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 3.00000000E+00, -1.00000000E+00);
    _TMP35 = COMPAT_TEXTURE(Texture, _c0163);
    _TMP36 = dot(_TMP35.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0167 = _tex + -vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y);
    _TMP37 = COMPAT_TEXTURE(Texture, _c0167);
    _TMP38 = dot(_TMP37.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0171 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 3.00000000E+00, -5.00000000E+00);
    _TMP39 = COMPAT_TEXTURE(Texture, _c0171);
    _TMP40 = dot(_TMP39.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _TMP69[0] = vec2(_TMP10 + _TMP12, _TMP14 + _TMP16);
    _TMP69[1] = vec2(_TMP18 + _TMP20, _TMP22 + _TMP24);
    _TMP69[2] = vec2(_TMP26 + _TMP28, _TMP30 + _TMP32);
    _TMP69[3] = vec2(_TMP34 + _TMP36, _TMP38 + _TMP40);
    _C0177[0] = _TMP69[0].x*_TMP69[0] + _TMP69[1].x*_TMP69[1] + _TMP69[2].x*_TMP69[2] + _TMP69[3].x*_TMP69[3];
    _C0179[1] = _TMP69[0].y*_TMP69[0] + _TMP69[1].y*_TMP69[1] + _TMP69[2].y*_TMP69[2] + _TMP69[3].y*_TMP69[3];
    _TMP66[0] = _TMP66[0] + _C0177[0];
    _TMP66[1] = _R[1] + _C0179[1];
    _r0181 = _y1.x*_TMP69[0];
    _r0181 = _r0181 + _y1.y*_TMP69[1];
    _r0181 = _r0181 + _y1.z*_TMP69[2];
    _r0181 = _r0181 + _y1.w*_TMP69[3];
    _r = _r + _r0181;
    _c0095 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -3.00000000E+00, 1.00000000E+00);
    _TMP1 = COMPAT_TEXTURE(Texture, _c0095);
    _TMP2 = dot(_TMP1.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0099 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 3.00000000E+00, -1.00000000E+00);
    _TMP3 = COMPAT_TEXTURE(Texture, _c0099);
    _TMP4 = dot(_TMP3.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0103 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, 3.00000000E+00);
    _TMP5 = COMPAT_TEXTURE(Texture, _c0103);
    _TMP6 = dot(_TMP5.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0107 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, -3.00000000E+00);
    _TMP7 = COMPAT_TEXTURE(Texture, _c0107);
    _TMP8 = dot(_TMP7.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _y1 = vec4(_TMP2, _TMP4, _TMP6, _TMP8);
    _c0111 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -5.00000000E+00, -1.00000000E+00);
    _TMP9 = COMPAT_TEXTURE(Texture, _c0111);
    _TMP10 = dot(_TMP9.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0115 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, 3.00000000E+00);
    _TMP11 = COMPAT_TEXTURE(Texture, _c0115);
    _TMP12 = dot(_TMP11.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0119 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -5.00000000E+00, 3.00000000E+00);
    _TMP13 = COMPAT_TEXTURE(Texture, _c0119);
    _TMP14 = dot(_TMP13.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0123 = _tex + -vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y);
    _TMP15 = COMPAT_TEXTURE(Texture, _c0123);
    _TMP16 = dot(_TMP15.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0127 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, -3.00000000E+00);
    _TMP17 = COMPAT_TEXTURE(Texture, _c0127);
    _TMP18 = dot(_TMP17.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0131 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 5.00000000E+00, 1.00000000E+00);
    _TMP19 = COMPAT_TEXTURE(Texture, _c0131);
    _TMP20 = dot(_TMP19.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0135 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y);
    _TMP21 = COMPAT_TEXTURE(Texture, _c0135);
    _TMP22 = dot(_TMP21.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0139 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 5.00000000E+00, -3.00000000E+00);
    _TMP23 = COMPAT_TEXTURE(Texture, _c0139);
    _TMP24 = dot(_TMP23.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0143 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, 1.00000000E+00);
    _TMP25 = COMPAT_TEXTURE(Texture, _c0143);
    _TMP26 = dot(_TMP25.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0147 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 3.00000000E+00, 5.00000000E+00);
    _TMP27 = COMPAT_TEXTURE(Texture, _c0147);
    _TMP28 = dot(_TMP27.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0151 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, 5.00000000E+00);
    _TMP29 = COMPAT_TEXTURE(Texture, _c0151);
    _TMP30 = dot(_TMP29.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0155 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 3.00000000E+00, 1.00000000E+00);
    _TMP31 = COMPAT_TEXTURE(Texture, _c0155);
    _TMP32 = dot(_TMP31.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0159 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -3.00000000E+00, -5.00000000E+00);
    _TMP33 = COMPAT_TEXTURE(Texture, _c0159);
    _TMP34 = dot(_TMP33.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0163 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, -1.00000000E+00);
    _TMP35 = COMPAT_TEXTURE(Texture, _c0163);
    _TMP36 = dot(_TMP35.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0167 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -3.00000000E+00, -1.00000000E+00);
    _TMP37 = COMPAT_TEXTURE(Texture, _c0167);
    _TMP38 = dot(_TMP37.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _c0171 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, -5.00000000E+00);
    _TMP39 = COMPAT_TEXTURE(Texture, _c0171);
    _TMP40 = dot(_TMP39.xyz, vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02));
    _TMP69[0] = vec2(_TMP10 + _TMP12, _TMP14 + _TMP16);
    _TMP69[1] = vec2(_TMP18 + _TMP20, _TMP22 + _TMP24);
    _TMP69[2] = vec2(_TMP26 + _TMP28, _TMP30 + _TMP32);
    _TMP69[3] = vec2(_TMP34 + _TMP36, _TMP38 + _TMP40);
    _C0177[0] = _TMP69[0].x*_TMP69[0] + _TMP69[1].x*_TMP69[1] + _TMP69[2].x*_TMP69[2] + _TMP69[3].x*_TMP69[3];
    _C0179[1] = _TMP69[0].y*_TMP69[0] + _TMP69[1].y*_TMP69[1] + _TMP69[2].y*_TMP69[2] + _TMP69[3].y*_TMP69[3];
    _TMP66[0] = _TMP66[0] + _C0177[0];
    _TMP66[1] = _TMP66[1] + _C0179[1];
    _r0181 = _y1.x*_TMP69[0];
    _r0181 = _r0181 + _y1.y*_TMP69[1];
    _r0181 = _r0181 + _y1.z*_TMP69[2];
    _r0181 = _r0181 + _y1.w*_TMP69[3];
    _r = _r + _r0181;
    _TMP64[0] = _TMP66[0]/2.40000000E+01;
    _TMP64[1] = _TMP66[1]/2.40000000E+01;
    _r = _r/2.40000000E+01;
    _TMP51 = _r.x*_TMP64[1].y - _r.y*_TMP64[1].x;
    _TMP52 = _TMP64[0].x*_r.y - _TMP64[0].y*_r.x;
    _TMP53 = _TMP64[0].x*_TMP64[1].y - _TMP64[0].y*_TMP64[1].x;
    _a = vec2(_TMP51, _TMP52)/_TMP53;
    _x0191 = _a.x - _a.y;
    _TMP54 = min(1.00000000E+00, _x0191);
    _TMP190 = max(-1.00000000E+00, _TMP54);
    _a = 2.50000000E-01 + vec2( 5.00000000E-01, -5.00000000E-01)*_TMP190;
    _c0197 = _tex + -vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y);
    _TMP46 = COMPAT_TEXTURE(Texture, _c0197);
    _c0199 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y);
    _TMP47 = COMPAT_TEXTURE(Texture, _c0199);
    _c0201 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( -1.00000000E+00, 1.00000000E+00);
    _TMP48 = COMPAT_TEXTURE(Texture, _c0201);
    _c0203 = _tex + vec2(5.00000000E-01/TextureSize.x, 5.00000000E-01/TextureSize.y)*vec2( 1.00000000E+00, -1.00000000E+00);
    _TMP49 = COMPAT_TEXTURE(Texture, _c0203);
    _TMP60[0] = _TMP46.xyz + _TMP47.xyz;
    _TMP60[1] = _TMP48.xyz + _TMP49.xyz;
    _C0205[0] = _a.x*_TMP60[0] + _a.y*_TMP60[1];
    _ret_0 = vec4(_C0205[0].x, _C0205[0].y, _C0205[0].z, 1.00000000E+00);
    FragColor = _ret_0;
    return;
} 
#endif
