//
//  BAPrototype+Blocks.m
//  Blocks
//
//  Created by Brent Gulanowski on 10-04-14.
//  Copyright 2010 Bored Astronaut Inc. All rights reserved.
//

#import "BAPrototype+Blocks.h"

#import "BAMesh+Blocks.h"

#import <BAScene/BASceneUtilities.h>
#import <BAScene/BATexture.h>

#import <objc/message.h>


@implementation BAPrototype (Blocks)

+ (BAPrototype *)blockWithMeshSelector:(SEL)selector {
	return [BAPrototype prototypeWithName:[NSString stringWithFormat:@"Blocks:Prototype:%@", NSStringFromSelector(selector)]
									 mesh:objc_msgSend([BAMesh class], selector)];
}

+ (BAPrototype *)block22 {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block31a {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block31b {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block31c {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block32a {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block32b {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block32c {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block32d {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block33a {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block33b {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block33c {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block42 {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block43 {
	return [self blockWithMeshSelector:_cmd];
}

+ (BAPrototype *)block44 {
	return [self blockWithMeshSelector:_cmd];
}


+ (BAPrototype *)planetWithImageNamed:(NSString *)name {
	
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
	BAMesh *mesh = [BAMesh meshWithName:meshName vertices:vertices count:12 texCoords:texCoords count:TC_COUNT vIndices:vertIndices tcIndices:texIndices count:20 polySize:3];
	
	[mesh setTexture:texture];
	mesh->appliesColor = NO;
	mesh.hasTextureValue = YES;
	
	return [BAPrototype prototypeWithName:meshName mesh:mesh];
}

+ (BAPrototype *)earth {
	return [self planetWithImageNamed:@"icoearth"];
}

+ (BAPrototype *)jupiter {
	return [self planetWithImageNamed:@"icojup"];
}

@end
