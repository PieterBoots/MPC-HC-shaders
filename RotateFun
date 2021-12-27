sampler s0 : register(s0);
float4 p0 : register(c0);
float4 p1 : register(c1);

#define width (p0[0])
#define height (p0[1])
#define counter (p0[2])
#define clock (p0[3])
#define one_over_width (p1[0])
#define one_over_height (p1[1])


float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float4 c0 ;
	
    float2 position = tex;        

    float x1=0.5-sin(clock*5.0);
	float y1=0.5-cos(clock*5.0);
	float x2=0.5+sin(clock*5.0);
	float y2=0.5+cos(clock*5.0);

	
	float d1=(x1-position.x)*(y1-position.y);
	float d2=(x2-position.x)*(y2-position.y);

    c0 = tex2D(s0, tex);
	
	if ((d1<d2)  )
	{
	   c0[0]=0.0;
	     c0[1]=0.0;
	   }
    else
	 {
	   c0[1]=0.0;
	     c0[2]=0.0;
	   }		  
	return c0;
}
