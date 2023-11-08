#import <Foundation/Foundation.h>
#import <simd/simd.h>
#import <vector>

struct V {
	std::vector<simd::float3> xyz;
	std::vector<int> faces;
};

struct VT {
	std::vector<simd::float2> xy;
	std::vector<int> faces;
};

int main(int argc, char *argv[]) {
	@autoreleasepool {
		
		const float radius = 1.0;
		const int iterations = 1;
		
		V v;
		v.xyz.push_back(simd::float3{0.000000,-1.000000,0.000000});
		v.xyz.push_back(simd::float3{0.723600,-0.447215,0.525720});
		v.xyz.push_back(simd::float3{-0.276385,-0.447215,0.850640});
		v.xyz.push_back(simd::float3{-0.894425,-0.447215,0.000000});
		v.xyz.push_back(simd::float3{-0.276385,-0.447215,-0.850640});
		v.xyz.push_back(simd::float3{0.723600,-0.447215,-0.525720});
		v.xyz.push_back(simd::float3{0.276385,0.447215,0.850640});
		v.xyz.push_back(simd::float3{-0.723600,0.447215,0.525720});
		v.xyz.push_back(simd::float3{-0.723600,0.447215,-0.525720});
		v.xyz.push_back(simd::float3{0.276385,0.447215,-0.850640});
		v.xyz.push_back(simd::float3{0.894425,0.447215,0.000000});
		v.xyz.push_back(simd::float3{0.000000,1.000000,0.000000});

		v.faces = {
			0,1,2,
			1,0,5,
			0,2,3,
			0,3,4,
			0,4,5,
			1,5,10,
			2,1,6,
			3,2,7,
			4,3,8,
			5,4,9,
			1,10,6,
			2,6,7,
			3,7,8,
			4,8,9,
			5,9,10,
			6,10,11,
			7,6,11,
			8,7,11,
			9,8,11,
			10,9,11,
		};
		
		int size = 60;
		for(unsigned short iteration=0; iteration<iterations; iteration++) {
			
			size*=4;
			std::vector<int> newFaces;
			
			for(int i=0; i<size/12; i++) {
				
				int i1 = v.faces[i*3];
				int i2 = v.faces[i*3+1];
				int i3 = v.faces[i*3+2];
				
				int i12 = (int)v.xyz.size();
				int i23 = i12+1;
				int i13 = i12+2;

				simd::float3 v1 = v.xyz[i1];
				simd::float3 v2 = v.xyz[i2];
				simd::float3 v3 = v.xyz[i3];
				
				v.xyz.push_back(simd_normalize(v1+v2));
				v.xyz.push_back(simd_normalize(v2+v3));
				v.xyz.push_back(simd_normalize(v3+v1));
				
				newFaces.push_back(i1);
				newFaces.push_back(i12);
				newFaces.push_back(i13);
				newFaces.push_back(i2);
				newFaces.push_back(i23);
				newFaces.push_back(i12);
				newFaces.push_back(i3);
				newFaces.push_back(i13);
				newFaces.push_back(i23);
				newFaces.push_back(i12);
				newFaces.push_back(i23);
				newFaces.push_back(i13);
			}
			
			v.faces.swap(newFaces);
		}
		
		VT vt;
		vt.xy.push_back(simd::float2{0.181819,0.000000});
		vt.xy.push_back(simd::float2{0.272728,0.157461});
		vt.xy.push_back(simd::float2{0.090910,0.157461});
		vt.xy.push_back(simd::float2{0.363637,0.000000});
		vt.xy.push_back(simd::float2{0.454546,0.157461});
		vt.xy.push_back(simd::float2{0.909091,0.000000});
		vt.xy.push_back(simd::float2{1.000000,0.157461});
		vt.xy.push_back(simd::float2{0.818182,0.157461});
		vt.xy.push_back(simd::float2{0.727273,0.000000});
		vt.xy.push_back(simd::float2{0.636364,0.157461});
		vt.xy.push_back(simd::float2{0.545455,0.000000});
		vt.xy.push_back(simd::float2{0.363637,0.314921});
		vt.xy.push_back(simd::float2{0.181819,0.314921});
		vt.xy.push_back(simd::float2{0.909091,0.314921});
		vt.xy.push_back(simd::float2{0.727273,0.314921});
		vt.xy.push_back(simd::float2{0.545455,0.314921});
		vt.xy.push_back(simd::float2{0.000000,0.314921});
		vt.xy.push_back(simd::float2{0.272728,0.472382});
		vt.xy.push_back(simd::float2{0.090910,0.472382});
		vt.xy.push_back(simd::float2{0.818182,0.472382});
		vt.xy.push_back(simd::float2{0.636364,0.472382});
		vt.xy.push_back(simd::float2{0.454546,0.472382});
		
		vt.faces = {
			0,1,2,
			1,3,4,
			5,6,7,
			8,7,9,
			10,9,4,
			1,4,11,
			2,1,12,
			7,6,13,
			9,7,14,
			4,9,15,
			1,11,12,
			2,12,16,
			7,13,14,
			9,14,15,
			4,15,11,
			12,11,17,
			16,12,18,
			14,13,19,
			15,14,20,
			11,15,21,
		};
		
		size = 60;
		for(unsigned short iteration=0; iteration<iterations; iteration++) {
			
			size*=4;
			std::vector<int> newFaces;
			
			for(int i=0; i<size/12; i++) {
				
				int i1 = vt.faces[i*3];
				int i2 = vt.faces[i*3+1];
				int i3 = vt.faces[i*3+2];
				
				int i12 = (int)vt.xy.size();
				int i23 = i12+1;
				int i13 = i12+2;
				
				simd::float2 vt1 = vt.xy[i1];
				simd::float2 vt2 = vt.xy[i2];
				simd::float2 vt3 = vt.xy[i3];
				
				vt.xy.push_back((vt2-vt1)*0.5+vt1);
				vt.xy.push_back((vt3-vt2)*0.5+vt2);
				vt.xy.push_back((vt1-vt3)*0.5+vt3);
				
				newFaces.push_back(i1);
				newFaces.push_back(i12);
				newFaces.push_back(i13);
				newFaces.push_back(i2);
				newFaces.push_back(i23);
				newFaces.push_back(i12);
				newFaces.push_back(i3);
				newFaces.push_back(i13);
				newFaces.push_back(i23);
				newFaces.push_back(i12);
				newFaces.push_back(i23);
				newFaces.push_back(i13);
			}
			
			vt.faces.swap(newFaces);
		}
		
		NSMutableString *str = [NSMutableString stringWithString:@""];
		
		for(int i=0; i<v.xyz.size(); i++) {
			[str appendString:[NSString stringWithFormat:@"v %0.4f %0.4f %0.4f\n",v.xyz[i].x*radius,v.xyz[i].y*radius,v.xyz[i].z*radius]];
		}
		
		for(int i=0; i<vt.xy.size(); i++) {
			[str appendString:[NSString stringWithFormat:@"vt %0.4f %0.4f\n",vt.xy[i].x,vt.xy[i].y]];
		}
		
		for(int i=0; i<v.faces.size()/3; i++) {
			[str appendString:[NSString stringWithFormat:@"f %d/%d %d/%d %d/%d\n",
				1+v.faces[i*3+0],1+vt.faces[i*3+0],
				1+v.faces[i*3+1],1+vt.faces[i*3+1],
				1+v.faces[i*3+2],1+vt.faces[i*3+2]]];
		}
		
		[str writeToFile:@"./icosphere.obj" atomically:YES encoding:NSUTF8StringEncoding error:nil];
	}
}