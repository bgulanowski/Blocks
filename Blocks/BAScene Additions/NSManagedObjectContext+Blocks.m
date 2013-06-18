//
//  NSManagedObjectContext+Blocks.m
//  Blocks
//
//  Created by Brent Gulanowski on 2013-06-13.
//
//

#import "NSManagedObjectContext+Blocks.h"

#import <BAScene/BAScene.h>
#import <BAScene/BASceneUtilities.h>
#import <BAScene/BATexture.h>

#import <objc/message.h>



@implementation NSManagedObjectContext (Blocks)

- (BAPrototype *)blockWithMeshSelector:(SEL)selector {
    NSString *selName = [NSStringFromSelector(selector) stringByAppendingString:@"Mesh"];
    SEL meshSel = NSSelectorFromString(selName);
	return [self prototypeWithName:[NSString stringWithFormat:@"Blocks:Prototype:%@", NSStringFromSelector(selector)]
                              mesh:objc_msgSend(self, meshSel)];
}

- (BAPrototype *)block22 {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block31a {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block31b {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block31c {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block32a {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block32b {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block32c {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block32d {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block33a {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block33b {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block33c {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block42 {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block43 {
	return [self blockWithMeshSelector:_cmd];
}

- (BAPrototype *)block44 {
	return [self blockWithMeshSelector:_cmd];
}


- (BAPrototype *)planetWithImageNamed:(NSString *)name {
	
#define TC_COUNT 22
	
	// Want to create a texture-mapped earth, but the default icosahedron shares vertices, which won't work with a normal icosahedron net image
	// There are actually 22 distinct points in the net
	
    //	NSString *path = [[NSBundle mainBundle] pathForResource:@"icoearth" ofType:@"bmp"];
    //	NSBitmapImageRep *bitmap = [NSBitmapImageRep imageRepWithData:[NSData dataWithContentsOfFile:path]];
	BAPointf vertices[12] = {
		iv01, iv02, iv03, iv04, iv05, iv06, iv07, iv08, iv09, iv10, iv11, iv12
	};
	// Sorted by x,y,z
	BAPointf texCoords[TC_COUNT] = {
		{  2, 0, 0 }, //iv01 {   0,  -1,-phi }
		{  0, 2, 0 }, //iv02 {   0,  -1, phi }
		{  5, 1, 0 }, //iv03 {   0,   1,-phi }
		{  1, 3, 0 }, //iv04 {   0,   1, phi }
		{  9, 1, 0 }, //iv05 {  -1,-phi,   0 }
		{  6, 2, 0 }, //iv06 {  -1, phi,   0 }
		{  1, 1, 0 }, //iv07 {   1,-phi,   0 }
		{  4, 2, 0 }, //iv08 {   1, phi,   0 }
		{  7, 1, 0 }, //iv09 {-phi,   0,  -1 }
		{  3, 1, 0 }, //iv10 { phi,   0,  -1 }
		{  8, 2, 0 }, //iv11 {-phi,   0,   1 }
		{  2, 2, 0 }, //iv12 { phi,   0,   1 }
		{  4, 0, 0 }, //iv01 {   0,  -1,-phi }
		{  6, 0, 0 }, //iv01 {   0,  -1,-phi }
		{  8, 0, 0 }, //iv01 {   0,  -1,-phi }
		{ 10, 0, 0 }, //iv01 {   0,  -1,-phi }
		{ 10, 2, 0 }, //iv02 {   0,  -1, phi }
		{  3, 3, 0 }, //iv04 {   0,   1, phi }
		{  5, 3, 0 }, //iv04 {   0,   1, phi }
		{  7, 3, 0 }, //iv04 {   0,   1, phi }
		{  9, 3, 0 }, //iv04 {   0,   1, phi }
		{ 11, 1, 0 }, //iv07 {   1,-phi,   0 }
	};
	NSUInteger texIndices[] = {
		12,2,9, 14,4,8, 15,21,4, 13,8,2, 0,9,6, 2,5,7, 2,7,9, 2,8,5,
		16,20,10, 16,4,21, 1,6,11, 16,10,4, 1,11,3, 19,5,10, 18,7,5, 17,11,7,
		4,10,8, 6,9,11, 5,8,10, 7,11,9
	};
	NSUInteger vertIndices[] = {
		0,2,9, 0,4,8, 0,6,4, 0,8,2, 0,9,6, 2,5,7, 2,7,9, 2,8,5,
		1,3,10, 1,4,6, 1,6,11, 1,10,4, 1,11,3, 3,5,10, 3,7,5, 3,11,7,
		4,10,8, 6,9,11, 5,8,10, 7,11,9
	};
	
	BATexture *texture = [BATexture textureNamed:name];
	GLfloat xScale = (GLfloat)texture.size.w / 11.0f;
	GLfloat yScale = (GLfloat)texture.size.h / 3.0f;
	
	for(NSUInteger i=0; i<TC_COUNT; ++i)
		texCoords[i].x *= xScale, texCoords[i].y *= yScale;
	
    NSString *meshName = [NSString stringWithFormat:@"Blocks:Prototype:%@", name];
	BAMesh *mesh = [self meshWithName:meshName vertices:vertices count:12 texCoords:texCoords count:TC_COUNT vIndices:vertIndices tcIndices:texIndices count:20 polySize:3];
	
	[mesh setTexture:texture];
	mesh->appliesColor = NO;
	mesh.hasTextureValue = YES;
	
	return [self prototypeWithName:meshName mesh:mesh];
}

- (BAPrototype *)earth {
	return [self planetWithImageNamed:@"icoearth"];
}

- (BAPrototype *)jupiter {
	return [self planetWithImageNamed:@"icojup"];
}


#define b000 { 0,0,0 }
#define b001 { 0,0,1 }
#define b010 { 0,1,0 }
#define b011 { 0,1,1 }
#define b100 { 1,0,0 }
#define b101 { 1,0,1 }
#define b110 { 1,1,0 }
#define b111 { 1,1,1 }


- (BAMesh *)block22Mesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b101, b011, b110};
		NSUInteger indices[] = {0,1,2, 0,2,3, 0,3,1, 1,3,2};
        
		block = [self meshWithName:blockName vertices:vertices count:4 indices:indices count:4 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block31aMesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b010};
		NSUInteger indices[] = {0,2,1, 0,3,2, 0,1,3, 1,2,3};
		
		block = [self meshWithName:blockName vertices:vertices count:4 indices:indices count:4 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block31bMesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b011};
		NSUInteger indices[] = {0,2,1, 0,3,2, 0,1,3, 1,2,3};
		
		block = [self meshWithName:blockName vertices:vertices count:4 indices:indices count:4 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block31cMesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b110};
		NSUInteger indices[] = {0,2,1, 0,3,2, 0,1,3, 1,2,3};
		
		block = [self meshWithName:blockName vertices:vertices count:4 indices:indices count:4 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block32aMesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b010, b110};
		NSUInteger indices[] = {0,2,1, 0,1,3, 0,3,2, 1,4,3, 1,2,4, 2,3,4};
		
		block = [self meshWithName:blockName vertices:vertices count:5 indices:indices count:6 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block32bMesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b010, b111};
		NSUInteger indices[] = {0,2,1, 0,1,3, 0,3,2, 1,4,3, 1,2,4, 2,3,4};
		
		block = [self meshWithName:blockName vertices:vertices count:5 indices:indices count:6 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block32cMesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b011, b110};
		NSUInteger indices[] = {0,2,1, 0,1,3, 0,3,4, 0,4,2, 1,2,3, 2,4,3};
		
		block = [self meshWithName:blockName vertices:vertices count:5 indices:indices count:6 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block32dMesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b011, b111};
		NSUInteger indices[] = {0,2,1, 0,1,3, 0,3,2, 1,4,3, 1,2,4, 2,3,4};
		
		block = [self meshWithName:blockName vertices:vertices count:5 indices:indices count:6 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block33aMesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b010, b011, b110};
		NSUInteger indices[] = {0,1,4, 0,2,1, 0,3,5, 0,5,2, 0,4,3, 1,2,5, 1,5,4, 3,4,5};
		
		block = [self meshWithName:blockName vertices:vertices count:6 indices:indices count:8 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block33bMesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b010, b011, b111};
		NSUInteger indices[] = {0,1,4, 0,2,1, 0,3,2, 0,4,3, 1,2,5, 1,5,4, 2,3,5, 3,4,5};
		
		block = [self meshWithName:blockName vertices:vertices count:6 indices:indices count:8 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block33cMesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b011, b110, b111};
		NSUInteger indices[] = {0,2,1, 0,1,3, 0,3,4, 0,4,2, 1,2,5, 1,5,3, 2,4,5, 3,5,4};
		
		block = [self meshWithName:blockName vertices:vertices count:6 indices:indices count:8 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block42Mesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b101, b011, b110};
		NSUInteger indices[] = {0,1,4, 0,2,3, 0,3,1, 0,4,5, 0,5,2, 1,3,4, 2,5,3, 3,5,4};
		
		block = [self meshWithName:blockName vertices:vertices count:6 indices:indices count:8 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block43Mesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b101, b010, b011, b110};
		NSUInteger indices[] = {0,1,5, 0,2,3, 0,3,1, 1,3,5, 0,4,2, 0,5,4, 2,4,6, 2,6,3, 3,6,5, 4,5,6};
		
		block = [self meshWithName:blockName vertices:vertices count:7 indices:indices count:10 polySize:3];
	}
	
	return block;
}

- (BAMesh *)block44Mesh {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [self findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b101, b010, b011, b110, b111};
		NSUInteger indices[] = {0,1,5, 0,2,3, 0,3,1, 0,4,6, 0,5,4, 0,6,2, 1,3,5, 2,6,3, 3,6,7, 3,7,5, 4,5,6, 5,7,6};
		
		block = [self meshWithName:blockName vertices:vertices count:8 indices:indices count:12 polySize:3];
	}
	
	return block;
}

- (BAPropGroup *)sampleBlocks {
	
	BAPropGroup *blocks = [self groupWithSuperGroup:nil];
	NSArray *protos = [NSArray arrayWithObjects:
					   @"icosahedron",
					   @"dodecahedron",
					   @"octahedron",
					   @"cube",
					   @"tetrahedron",
					   @"block22",
					   @"block31a",
					   @"block31b",
					   @"block31c",
					   @"block32a",
					   @"block32b",
					   @"block32c",
					   @"block32d",
					   @"block33a",
					   @"block33b",
					   @"block42",
					   @"block43",
					   @"block44",
					   nil];
    
    double l = floor(pow([protos count], 1.0f/3.0f)) * 0.5f;
	double x = -l, y = -l, z = -l;
	
	NSMutableSet *set = [NSMutableSet setWithCapacity:[protos count]];
	
	for(NSString *selName in protos) {
        
		if(x>l) {
            ++z; x=-l;
        }
		if(z>l) {
            ++y; z=-l;
        }
        
        SEL selector = NSSelectorFromString(selName);
        NSString *name = [NSString stringWithFormat:@"Block:%@", selName];
        BATransform *xform = [self translationWithX:x*5.0f y:y*5.0f z:z*5.0f];
		BAProp *prop = [self propWithName:name prototype:[self performSelector:selector] transform:xform];
		
		prop.color = [self randomOpaqueColor];
		[set addObject:prop];
        ++x;
	}
	
	[blocks addProps:set];
    
    return blocks;
}

- (BAPropGroup *)planets {
    
	BAPropGroup *blocks = [self groupWithSuperGroup:nil];
    BATransform *transform = [self insertBATransform];
    
	[transform rotateX:-45 y:0 z:0];
	[blocks addPropsObject:[self propWithName:@"earth" prototype:[self earth] transform:transform]];
    
    transform = [self translationWithX:5 y:20 z:5];
    [transform rotateX:-45 y:0 z:0];
    [transform scaleX:10 y:10 z:10];
	[blocks addPropsObject:[self propWithName:@"jupiter" prototype:[self jupiter] transform:transform]];
    
    return blocks;
}


- (BAPropGroup *)boxOfBoxes {
    
	// Make a big box of cubes
	BAPropGroup *boxes = [self groupWithSuperGroup:nil];
	BAPrototype *proto = [self block44];
    BATransform *xform = [self scaleWithX:5.0f y:5.0f z:5.0f];
	NSInteger cx = 8, cy = 5, cz = 8, i = 0, j = 0, k = 0;
	
	for( i=0 ; i<cx; ++i ) {
		for( j=0 ; j<cy; ++j ) {
			for( k=0 ; k<cz; ++k ) {
				if( 0==k||cz-1==k||0==j||cy-1==j||0==i||cx-1==i) {
                    BATransform *copy = [self transformWithMatrix4x4f:xform.transform];
                    [copy translateX:5.0f*(-i-4) y:5.0f*(-j-4) z:5.0f*(-k-4)];
					[boxes addPropsObject:[self propWithName:nil prototype:proto transform:copy]];
                }
			}
		}
	}
    
    [boxes flattenPropsWithBlock:^BOOL(BAProp *prop) { return YES; }];
    boxes.mergedProp.color = [self colorWithRed:0.2f green:0.2f blue:0.8f];
	
	NSLog(@"Created %lu boxes (should be %ld)", [boxes.props count], cx*cy*cz - (cx-2)*(cy-2)*(cz-2));
    
    return boxes;
}

@end
