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
	float radius=2.0;//1.0 .... 5.0
	float strength=1.0;//0.5 .... 8.0
             
			
	
	float4 c0 = tex2D(s0, tex);
	float4 yuv=rgb2yuv(c0);	
	float min=999.0;
	float max=0.0;	
	float dx = 1 / width;
	float dy = 1 / height;	
	for(int y1=-radius;y1<=radius;y1++)
	  for(int x1=-radius;x1<=radius;x1++)
	  {
	    if (x1*x1+y1*y1<=radius*radius)
		{
	      float4 yuv00 = rgb2yuv(getPixel(tex, x1*dx, y1*dy));
		  if (yuv00[0]>max)
		     max=yuv00[0];
	      if (yuv00[0]<min)
		     min=yuv00[0];
		}
	  }
								    
	
 
	  if (abs(max-yuv[0])<abs(min-yuv[0]) )	
	    yuv[0]=(yuv[0]*1.0+max*strength)/(1.0+strength);
    	else
	    yuv[0]=(yuv[0]*1.0+min*strength)/(1.0+strength);

	 
	return yuv2rgb(yuv);
}
