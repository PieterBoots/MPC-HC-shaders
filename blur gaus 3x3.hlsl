/*
 * (C) 2003-2006 Gabest
 * (C) 2006-2013 see Authors.txt
 *
 * This file is part of MPC-HC.
 *
 * MPC-HC is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * MPC-HC is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

sampler s0 : register(s0);
float4 p0 :  register(c0);
float4 p1 :  register(c1);

#define width  (p0[0])
#define height (p0[1])


#define effect_width (1.6)

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float dx = effect_width / width;
	float dy = effect_width / height;
	

	float dx1=-dx;
	float dx2=0.0;
	float dx3=dx;

	
  
	float dy1=-dy;
	float dy2=0.0;
	float dy3=dy;
	

	
	float4 c1 =float4(0.0,0.0,0.0,0.0);
	float tot=0.0;
	float coef=0.0;
	

	coef=1.0;
	c1+=tex2D(s0, tex + float2( dx1, dy1)) * coef;
	tot+=coef;
	coef=2.0;
	c1+=tex2D(s0, tex + float2( dx2, dy1)) * coef;
	tot+=coef;
    coef=1.0;
	c1+=tex2D(s0, tex + float2( dx3, dy1)) * coef;
	tot+=coef;

	
				

	coef=2.0;
	c1+=tex2D(s0, tex + float2( dx1, dy2)) * coef;
	tot+=coef;
	coef=4.0;
	c1+=tex2D(s0, tex + float2( dx2, dy2)) * coef;
	tot+=coef;
    coef=2.0;
	c1+=tex2D(s0, tex + float2( dx3, dy2)) * coef;
	tot+=coef;

		
	

	coef=1.0;
	c1+=tex2D(s0, tex + float2( dx1, dy3)) * coef;
	tot+=coef;
	coef=2.0;
	c1+=tex2D(s0, tex + float2( dx2, dy3)) * coef;
	tot+=coef;
    coef=1.0;
	c1+=tex2D(s0, tex + float2( dx3, dy3)) * coef;
	tot+=coef;
 
	

			

	return c1/tot;
}
