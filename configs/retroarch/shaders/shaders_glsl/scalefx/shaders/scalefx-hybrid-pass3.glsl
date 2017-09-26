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
COMPAT_VARYING     vec4 _t2;
COMPAT_VARYING     vec4 _t1;
COMPAT_VARYING     vec2 _texCoord1;
COMPAT_VARYING     vec4 _position1;
COMPAT_VARYING     vec2 _tex_coord;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
};
struct prev {
    vec2 _texture_size1;
    vec2 _tex_coord;
float _placeholder35;
};
struct out_vertex {
    vec4 _position1;
    vec2 _texCoord1;
    vec4 _t1;
    vec4 _t2;
};
out_vertex _ret_0;
prev _PASSPREV41;
vec4 _r0007;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
 
uniform COMPAT_PRECISION vec2 PassPrev4TextureSize;
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
COMPAT_ATTRIBUTE vec2 PassPrev4TexCoord;
void main()
{
    out_vertex _OUT;
    vec2 _ps;
    _r0007 = VertexCoord.x*MVPMatrix[0];
    _r0007 = _r0007 + VertexCoord.y*MVPMatrix[1];
    _r0007 = _r0007 + VertexCoord.z*MVPMatrix[2];
    _r0007 = _r0007 + VertexCoord.w*MVPMatrix[3];
    _ps = 1.00000000E+00/PassPrev4TextureSize;
    _OUT._t1 = PassPrev4TexCoord.xxxy + vec4(-_ps.x, 0.00000000E+00, _ps.x, 0.00000000E+00);
    _OUT._t2 = PassPrev4TexCoord.xyxy + vec4(0.00000000E+00, -_ps.y, 0.00000000E+00, _ps.y);
    _ret_0._position1 = _r0007;
    _ret_0._texCoord1 = TexCoord.xy;
    _ret_0._t1 = _OUT._t1;
    _ret_0._t2 = _OUT._t2;
    gl_Position = _r0007;
    TEX0.xy = TexCoord.xy;
    TEX1 = _OUT._t1;
    TEX2 = _OUT._t2;
    return;
    TEX0.xy = _ret_0._texCoord1;
    TEX1 = _ret_0._t1;
    TEX2 = _ret_0._t2;
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
COMPAT_VARYING     vec4 _t2;
COMPAT_VARYING     vec4 _t1;
COMPAT_VARYING     vec2 _texCoord;
COMPAT_VARYING     vec2 _tex_coord;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
};
struct prev {
    vec2 _texture_size1;
    vec2 _tex_coord;
float _placeholder36;
};
struct out_vertex {
    vec2 _texCoord;
    vec4 _t1;
    vec4 _t2;
};
vec4 _TMP13;
vec2 _TMP9;
vec2 _TMP10;
vec2 _TMP11;
vec2 _TMP12;
float _TMP1;
float _TMP4;
float _TMP7;
float _TMP8;
float _TMP5;
float _TMP6;
float _TMP2;
float _TMP3;
vec2 _TMP0;
vec4 _TMP15;
vec4 _TMP18;
vec4 _TMP17;
vec4 _TMP16;
vec4 _TMP14;
uniform sampler2D Texture;
input_dummy _IN1;
prev _PASSPREV41;
vec4 _TMP25;
vec4 _a0028;
vec4 _c0028;
vec4 _a0030;
vec4 _TMP37;
vec4 _a0040;
vec4 _c0040;
vec4 _a0042;
vec2 _x0050;
vec2 _x0052;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
 
uniform sampler2D PassPrev4Texture;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    vec4 _E;
    vec2 _fp;
    _E = COMPAT_TEXTURE(Texture, TEX0.xy);
    _a0028 = _E*2.40000000E+01 + 5.00000000E-01;
    _a0030 = _a0028/vec4( 5.00000000E+00, 5.00000000E+00, 5.00000000E+00, 5.00000000E+00);
    _TMP16 = abs(_a0030);
    _TMP17 = fract(_TMP16);
    _TMP18 = abs(vec4( 5.00000000E+00, 5.00000000E+00, 5.00000000E+00, 5.00000000E+00));
    _c0028 = _TMP17*_TMP18;
    _TMP14 = vec4(_a0028.x < 0.00000000E+00 ? (-_c0028).x : _c0028.x, _a0028.y < 0.00000000E+00 ? (-_c0028).y : _c0028.y, _a0028.z < 0.00000000E+00 ? (-_c0028).z : _c0028.z, _a0028.w < 0.00000000E+00 ? (-_c0028).w : _c0028.w);
    _TMP25 = floor(_TMP14);
    _a0040 = _E*4.80000019E+00 + 1.00000001E-01;
    _a0042 = _a0040/vec4( 5.00000000E+00, 5.00000000E+00, 5.00000000E+00, 5.00000000E+00);
    _TMP16 = abs(_a0042);
    _TMP17 = fract(_TMP16);
    _TMP18 = abs(vec4( 5.00000000E+00, 5.00000000E+00, 5.00000000E+00, 5.00000000E+00));
    _c0040 = _TMP17*_TMP18;
    _TMP15 = vec4(_a0040.x < 0.00000000E+00 ? (-_c0040).x : _c0040.x, _a0040.y < 0.00000000E+00 ? (-_c0040).y : _c0040.y, _a0040.z < 0.00000000E+00 ? (-_c0040).z : _c0040.z, _a0040.w < 0.00000000E+00 ? (-_c0040).w : _c0040.w);
    _TMP37 = floor(_TMP15);
    _x0050 = TEX0.xy*TextureSize;
    _TMP0 = fract(_x0050);
    _x0052 = 3.00000000E+00*_TMP0;
    _fp = floor(_x0052);
    if (_fp.y == 0.00000000E+00) { 
        if (_fp.x == 0.00000000E+00) { 
            _TMP2 = _TMP25.x;
        } else {
            if (_fp.x == 1.00000000E+00) { 
                _TMP3 = _TMP37.x;
            } else {
                _TMP3 = _TMP25.y;
            } 
            _TMP2 = _TMP3;
        } 
        _TMP1 = _TMP2;
    } else {
        if (_fp.y == 1.00000000E+00) { 
            if (_fp.x == 0.00000000E+00) { 
                _TMP5 = _TMP37.w;
            } else {
                if (_fp.x == 1.00000000E+00) { 
                    _TMP6 = 0.00000000E+00;
                } else {
                    _TMP6 = _TMP37.y;
                } 
                _TMP5 = _TMP6;
            } 
            _TMP4 = _TMP5;
        } else {
            if (_fp.x == 0.00000000E+00) { 
                _TMP7 = _TMP25.w;
            } else {
                if (_fp.x == 1.00000000E+00) { 
                    _TMP8 = _TMP37.z;
                } else {
                    _TMP8 = _TMP25.z;
                } 
                _TMP7 = _TMP8;
            } 
            _TMP4 = _TMP7;
        } 
        _TMP1 = _TMP4;
    } 
    if (_TMP1 == 0.00000000E+00) { 
        _TMP9 = TEX1.yw;
    } else {
        if (_TMP1 == 1.00000000E+00) { 
            _TMP10 = TEX1.xw;
        } else {
            if (_TMP1 == 2.00000000E+00) { 
                _TMP11 = TEX1.zw;
            } else {
                if (_TMP1 == 3.00000000E+00) { 
                    _TMP12 = TEX2.xy;
                } else {
                    _TMP12 = TEX2.zw;
                } 
                _TMP11 = _TMP12;
            } 
            _TMP10 = _TMP11;
        } 
        _TMP9 = _TMP10;
    } 
    _TMP13 = COMPAT_TEXTURE(PassPrev4Texture, _TMP9);
    FragColor.xyz = _TMP13.xyz;
    return;
} 
#endif