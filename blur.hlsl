

sampler s0 : register(s0);
float4 p0 :  register(c0);
float4 p1 :  register(c1);

#define width  (p0[0])
#define height (p0[1])


#define effect_width (1.6)

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	
  //........................
  //change these
	float val1=1.0/16.0;
	float val2=1.0/8.0;
	float val0=1.0/4.0;
  //.......................
  
  
  
  float dx = effect_width / width;
	float dy = effect_width / height;
	float total=4.0*val1+4.0*val2+val0;
	
	float4 c2 = tex2D(s0, tex + float2(  0, -dy)) * val2;
	float4 c3 = tex2D(s0, tex + float2(-dx,   0)) * val2;
	float4 c4 = tex2D(s0, tex + float2( dx,   0)) * val2;
	float4 c5 = tex2D(s0, tex + float2(  0,  dy)) * val2;
	
	float4 c1 = tex2D(s0, tex + float2(-dx, -dy)) * val1;
	float4 c6 = tex2D(s0, tex + float2( dx,  dy)) * val1;
	float4 c7 = tex2D(s0, tex + float2(-dx, +dy)) * val1;
	float4 c8 = tex2D(s0, tex + float2(+dx, -dy)) * val1;
	float4 c9 = tex2D(s0, tex) * val0;

	float4 c0 = (c1 + c2 + c3 + c4 + c5 + c6 + c7 + c8 + c9)/total;

	return c0;
}
