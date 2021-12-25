sampler s0 : register(s0);
float4 p0 : register(c0);
float4 p1 : register(c1);

#define width (p0[0])
#define height (p0[1])
#define counter (p0[2])
#define clock (p0[3])
#define one_over_width (p1[0])
#define one_over_height (p1[1])

#define PI acos(-1)

float4 getPixel(float2 tex, float dx, float dy)
{
	tex.x += dx;
	tex.y += dy;

	return tex2D(s0, tex);
}
 
float4 rgb2yuv(float4 rgb)
{
	float4x4 coeffs = {
		 0.299,  0.587,  0.114, 0.000,
		-0.147, -0.289,  0.436, 0.000,
		 0.615, -0.515, -0.100, 0.000,
		 0.000,  0.000,  0.000, 0.000
	};

	return mul(coeffs, rgb);
}

float4 yuv2rgb(float4 yuv)
{
	float4x4 coeffs = {
		1.000,  0.000,  1.140, 0.000,
		1.000, -0.395, -0.581, 0.000,
		1.000,  2.032,  0.000, 0.000,
		0.000,  0.000,  0.000, 0.000
	};

	return mul(coeffs, yuv);
}

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float4 c0 = tex2D(s0, tex);
    float4 yuv=rgb2yuv(c0);	
    float value=round(yuv[0]*255.0/32.0)/255.0*32.0;   
	  
	 yuv[0]=value;
	return yuv2rgb(yuv);
}
